package com.epam.lab.buyit.controller.service.product;

import java.util.ArrayList;
import java.util.List;

//import com.epam.lab.buyit.controller.dao.auction.AuctionDAO;
//import com.epam.lab.buyit.controller.dao.description.DescriptionDAO;
import com.epam.lab.buyit.controller.dao.image.ImageDAO;
import com.epam.lab.buyit.controller.dao.product.ProductDAO;
import com.epam.lab.buyit.controller.service.auction.AuctionServiceImp;
import com.epam.lab.buyit.controller.service.description.DescriptionServiceImpl;
import com.epam.lab.buyit.model.Auction;
import com.epam.lab.buyit.model.Description;
import com.epam.lab.buyit.model.Product;

public class ProductServiceImpl implements ProductService {
	private ProductDAO productDAO;
	//private DescriptionDAO descriptionDAO;
	private ImageDAO imageDAO; 
	private DescriptionServiceImpl descriptionServiceImpl; 
	private AuctionServiceImp auctionService;

	public ProductServiceImpl() {
		productDAO = new ProductDAO();
		//descriptionDAO = new DescriptionDAO();
		//auctionDAO = new AuctionDAO();
		imageDAO=new ImageDAO();
		descriptionServiceImpl = new DescriptionServiceImpl();
		auctionService = new AuctionServiceImp();
	}

	@Override
	public Product getItemById(int id) {
		Product currentProduct = productDAO.getElementById(id);
		int productId =currentProduct.getIdProduct();
		Auction auction = auctionService.getByProductId(productId);
		Description description = descriptionServiceImpl.getByProductId(productId);
		
		currentProduct.setDescription(description);
		currentProduct.setAuction(auction);
		return currentProduct;
	}

	@Override
	public List<Product> getAllItems() {
		List<Product> products = productDAO.getAllProducts();
		//List<Description> descriptions = descriptionDAO.getAllDescriptions();
		List<Description> descriptions = descriptionServiceImpl.getAllItems();
		for (Product currentProduct : products) {
			setProductDescription(currentProduct, descriptions);
		}
		return products;
	}

	@Override
	public Product createItem(Product item) {
		int generated_product_id = productDAO.createElement(item);
		item.setIdProduct(generated_product_id);

		Description description = item.getDescription();
		description.setProductId(generated_product_id);
		//descriptionDAO.createElement(description);
		descriptionServiceImpl.createItem(description);

		return item;
	}

	@Override
	public Product updateItem(Product item) {
		throw new UnsupportedOperationException();
	}

	@Override
	public Product updateByProductId(Product item) {
		productDAO.updateElement(item);

		Description description = item.getDescription();
		description.setIdDescription(item.getIdProduct());
		//descriptionDAO.updateElement(description);
		descriptionServiceImpl.updateItem(description);

		return item;
	}

	private void setProductDescription(Product currentProduct,
			List<Description> descriptions) {
		for (Description currentDescription : descriptions) {
			if (currentDescription.getProductId() == currentProduct
					.getIdProduct()) {
				currentDescription.setItemPhotos(imageDAO.getImagesByDescriptionId(currentDescription
						.getIdDescription()));
				currentProduct.setDescription(currentDescription);
				break;
			}
		}
		return;
	}

	@Override
	public int getCountBySubCategoryId(int id) {
		return productDAO.getCountBySubCategoryId(id);
	}

	@Override
	public List<Product> getLatestProducts(int number) {
		List<Product> latestProducts = new ArrayList<Product>();
		List<Auction> latestAuctions = auctionService.getLatestAuctions(number);
		for (Auction currAuction : latestAuctions) {
			Product currProduct = productDAO.getElementById(currAuction
					.getProductId());
			currProduct.setAuction(currAuction);
			latestProducts.add(currProduct);
			
		}
		//List<Description> descriptions = descriptionDAO.getAllDescriptions();
		List<Description> descriptions = descriptionServiceImpl.getAllItems();
		for (Product currentProduct : latestProducts) {
			setProductDescription(currentProduct, descriptions);
		}
		return latestProducts;
	}

}
