package com.codegym.service;

import com.codegym.model.Product;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class ProductServiceImpl implements ProductService {
    private static Map<Integer, Product> products = new HashMap<>();

    static {
        products.put(1, new Product(1, "iPhone 15", 1200.0, "Latest Apple smartphone", "Apple"));
        products.put(2, new Product(2, "Galaxy S24", 1000.0, "Samsung flagship phone", "Samsung"));
        products.put(3, new Product(3, "MacBook Pro M3", 1999.0, "High performance laptop", "Apple"));
        products.put(4, new Product(4, "Dell XPS 13", 1100.0, "Compact Windows laptop", "Dell"));
        products.put(5, new Product(5, "iPad Air", 600.0, "Tablet for creative work", "Apple"));
    }

    @Override
    public List<Product> findAll() {
        return new ArrayList<>(products.values());
    }

    @Override
    public void save(Product product) {
        products.put(product.getId(), product);
    }

    @Override
    public Product findById(int id) {
        return products.get(id);
    }

    @Override
    public void update(int id, Product product) {
        products.put(id, product);
    }

    @Override
    public void remove(int id) {
        products.remove(id);
    }

    @Override
    public List<Product> findByName(String name) {
        List<Product> result = new ArrayList<>();
        for (Product p : products.values()) {
            if (p.getName().toLowerCase().contains(name.toLowerCase())) {
                result.add(p);
            }
        }
        return result;
    }
}
