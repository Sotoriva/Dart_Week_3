package br.com.academiadoflutter.pizzaDeliveryApi.repositories;

import org.springframework.data.jpa.repository.JpaRepository;

import br.com.academiadoflutter.pizzaDeliveryApi.entities.MenuE;

public interface MenuRepository extends JpaRepository<MenuE, Long> {
  
}
