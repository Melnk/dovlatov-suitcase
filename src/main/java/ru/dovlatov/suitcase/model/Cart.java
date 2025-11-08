package ru.dovlatov.suitcase.model;

import java.util.HashMap;
import java.util.Map;

public class Cart {
    private final Map<Integer, Integer> items = new HashMap<>();

    public void addItem(int productId) {
        items.merge(productId, 1, Integer::sum);
    }

    public void addItem(int productId, int quantity) {
        items.merge(productId, quantity, Integer::sum);
    }

    public void removeItem(int productId) {
        items.remove(productId);
    }

    public void updateQuantity(int productId, int quantity) {
        if (quantity <= 0) {
            removeItem(productId);
        } else {
            items.put(productId, quantity);
        }
    }

    public Map<Integer, Integer> getItems() {
        return items;
    }

    public void clear() {
        items.clear();
    }

    public boolean isEmpty() {
        return items.isEmpty();
    }
}
