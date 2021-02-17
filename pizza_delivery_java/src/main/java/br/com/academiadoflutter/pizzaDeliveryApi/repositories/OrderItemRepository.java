package br.com.academiadoflutter.pizzaDeliveryApi.repositories;

import org.springframework.data.jpa.repository.JpaRepository;

import br.com.academiadoflutter.pizzaDeliveryApi.entities.OrderItemE;

public interface OrderItemRepository extends JpaRepository<OrderItemE, Long> {
  
}
