using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using MidiJack;

public class MIDIEvents : MonoBehaviour
{
	public GameObject originalObject;

	public Light lightA, lightB;

	private List<GameObject> clonedObjects = new List<GameObject>();

	private float time;

	void Start()
	{
		for (int x = -10; x <= 10; x++)
		{
			for (int z = -10; z <= 10; z++)
			{
				GameObject clonedObject = Instantiate(
					originalObject,
					new Vector3(x, 0, z),
					Quaternion.identity
					);

				clonedObject.transform.parent = transform;
				clonedObject.SetActive(true);

				clonedObjects.Add(clonedObject);
			}
		}
	}

	void Update()
	{
		float waveSize = MidiMaster.GetKnob(0x0D, 0) * 10 + 1;
		float speed = MidiMaster.GetKnob(0x0E, 0) / 10;
		float waveHeight = MidiMaster.GetKnob(0x0F, 0) * 2;

		time += speed;

		foreach (GameObject clonedObject in clonedObjects)
		{
			float x = clonedObject.transform.position.x;
			float y = Mathf.Sin(x / waveSize + time) * waveHeight;
			float z = clonedObject.transform.position.z;

			clonedObject.transform.SetPositionAndRotation(new Vector3(x, y, z), Quaternion.identity);
		}

		bool randomize = MidiMaster.GetKeyDown(0x2C);

		if (randomize)
		{
			float randomHueA = Random.Range(0f, 1f);
			float randomHueB = Random.Range(0f, 1f);

			float randomSaturationA = Random.Range(0f, 1f);
			float randomSaturationB = Random.Range(0f, 1f);

			lightA.color = Color.HSVToRGB(randomHueA, randomSaturationA, 1f);
			lightB.color = Color.HSVToRGB(randomHueB, randomSaturationB, 1f);
		}
	}
}
