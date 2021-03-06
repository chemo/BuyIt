package com.epam.lab.buyit.model;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

public class Description implements Serializable {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private int productId;
	private int idDescription;
	private String features;
	private String descText;
	private List<Image> itemPhotos;

	public Description() {
		itemPhotos = new ArrayList<Image>();
	}
	
	public int getIdDescription() {
		return idDescription;
	}

	public Description setIdDescription(int idDescription) {
		this.idDescription = idDescription;
		return this;
	}

	public String getFeatures() {
		return features;
	}

	public Description setFeatures(String features) {
		this.features = features;
		return this;
	}

	public String getDescText() {
		return descText;
	}

	public Description setDescText(String descText) {
		this.descText = descText;
		return this;
	}

	public List<Image> getItemPhotos() {
		return itemPhotos;
	}

	public Description setItemPhotos(List<Image> itemPhotos) {
		this.itemPhotos = itemPhotos;
		return this;
	}

	public Description setItemPhoto(Image image) {
		itemPhotos.add(image);
		return this;
	}

	public Image getItemPhoto(int number) {
		return itemPhotos.get(number);
	}
	
	public int getProductId() {
		return productId;
	}

	public void setProductId(int productId) {
		this.productId = productId;
	}
	
	@Override
	public String toString() {
		StringBuilder string = new StringBuilder();
		string.append(idDescription).append(" features: ").append(features)
				.append(" description: ").append(descText).append(itemPhotos);
		return string.toString();
	}

}
