package org.jsp;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

@Entity
public class FoodItem {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
   private int id;
   private String name;
   private String description;
   private String category;
   private String type;
   private double price;
   private double rating;
   private String image;
   
   public FoodItem() {
	   
   }
   public FoodItem(int id, String name, String description, String category, String type, double price, double rating,
		String image) {
	super();
	this.id = id;
	this.name = name;
	this.description = description;
	this.category = category;
	this.type = type;
	this.price = price;
	this.rating = rating;
	this.image = image;
}
public int getId() {
	return id;
}
public void setId(int id) {
	this.id = id;
}
public String getName() {
	return name;
}
public void setName(String name) {
	this.name = name;
}
public String getDescription() {
	return description;
}
public void setDescription(String description) {
	this.description = description;
}
public String getCategory() {
	return category;
}
public void setCategory(String category) {
	this.category = category;
}
public String getType() {
	return type;
}
public void setType(String type) {
	this.type = type;
}
public double getPrice() {
	return price;
}
public void setPrice(double price) {
	this.price = price;
}
public double getRating() {
	return rating;
}
public void setRating(double rating) {
	this.rating = rating;
}
public String getImage() {
	return image;
}
public void setImage(String image) {
	this.image = image;
}
@Override
public String toString() {
	return "FoodItem [id=" + id + ", name=" + name + ", description=" + description + ", category=" + category
			+ ", type=" + type + ", price=" + price + ", rating=" + rating + ", image=" + image + "]";
}   
}
