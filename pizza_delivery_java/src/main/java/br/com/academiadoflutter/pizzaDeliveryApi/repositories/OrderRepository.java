package br.com.academiadoflutter.pizzaDeliveryApi.repositories;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import br.com.academiadoflutter.pizzaDeliveryApi.entities.OrderE;

public interface OrderRepository extends JpaRepository<OrderE, Long> {
  List<OrderE> findByUserIdOrderById(Long userId);

  // @Query(value = "SELECT * FROM pedidos WHERE usuario_id = ?1", nativeQuery = true)
  // List<OrderE> findByUserIdOrderById(Long userId);
}
