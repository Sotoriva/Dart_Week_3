package br.com.academiadoflutter.pizzaDeliveryApi.services;

import java.util.List;

import org.springframework.stereotype.Service;

import br.com.academiadoflutter.pizzaDeliveryApi.entities.MenuE;
import br.com.academiadoflutter.pizzaDeliveryApi.repositories.MenuRepository;
import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class MenuService {
  private final MenuRepository repository;

  public List<MenuE> findAll() {
    return repository.findAll();
  }
}
