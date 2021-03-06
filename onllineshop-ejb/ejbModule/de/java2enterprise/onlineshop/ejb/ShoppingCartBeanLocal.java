package de.java2enterprise.onlineshop.ejb;

import java.math.BigDecimal;
import java.util.List;

import javax.ejb.Local;

import de.java2enterprise.onlineshop.model.Item;

@Local
public interface ShoppingCartBeanLocal {
	
	public BigDecimal persist(Long id);
	
	public void addItem(Item item) throws CloneNotSupportedException;
	
	public void removeItem(Long id);
	
	public List<Item> getItems();
	
	public Boolean cartIsNotEmpty();
	
	public Item getItem();
	
	public void setItem(Item item);
	
	
}
