package com.kh.person;

import java.util.Objects;

// model에 해당
public class Person {

	private String id;
	private String name;
	private char gender;
	private int age;
	private boolean married;

	public Person() {

	}

	public Person(String id, String name, char gender, int age, boolean married) {
		super();
		this.id = id;
		this.name = name;
		this.gender = gender;
		this.age = age;
		this.married = married;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public char getGender() {
		return gender;
	}

	public void setGender(char gender) {
		this.gender = gender;
	}

	public int getAge() {
		return age;
	}

	public void setAge(int age) {
		this.age = age;
	}

	public boolean isMarried() {
		return married;
	}

	public void setMarried(boolean married) {
		this.married = married;
	}

	// toString, hashCode, equals를 만들어준다.
	@Override
	public String toString() {
		return "Person [id=" + id + ", name=" + name + ", gender=" + gender + ", age=" + age + ", married=" + married
				+ "]";
	}

	@Override
	public int hashCode() {
		return Objects.hash(age, gender, id, married, name);
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		Person other = (Person) obj;
		return age == other.age && gender == other.gender && Objects.equals(id, other.id) && married == other.married
				&& Objects.equals(name, other.name);
	}

}
