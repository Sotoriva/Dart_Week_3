package br.com.academiadoflutter.pizzaDeliveryApi.repositories;

import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;

import br.com.academiadoflutter.pizzaDeliveryApi.entities.UserE;

public interface UserRepository extends JpaRepository<UserE, Long> {

  Optional<UserE> findByEmail(String email);

}
