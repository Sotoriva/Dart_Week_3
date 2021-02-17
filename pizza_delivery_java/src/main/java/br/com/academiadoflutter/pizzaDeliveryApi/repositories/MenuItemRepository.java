package br.com.academiadoflutter.pizzaDeliveryApi.repositories;

import org.springframework.data.jpa.repository.JpaRepository;

import br.com.academiadoflutter.pizzaDeliveryApi.entities.MenuItemE;

public interface MenuItemRepository extends JpaRepository<MenuItemE, Long> {
  
}
