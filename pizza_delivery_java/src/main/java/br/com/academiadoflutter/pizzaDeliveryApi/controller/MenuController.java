package br.com.academiadoflutter.pizzaDeliveryApi.controller;

import java.util.List;
import java.util.stream.Collectors;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import br.com.academiadoflutter.pizzaDeliveryApi.dto.MenuResponse;
import br.com.academiadoflutter.pizzaDeliveryApi.services.MenuService;
import lombok.RequiredArgsConstructor;

@RestController
@RequestMapping(value = "/menu")
@RequiredArgsConstructor
public class MenuController {
  private final MenuService menuService;

  @GetMapping("/")
  public List<MenuResponse> findAll() {
    final var menus = menuService.findAll();

    // List<MenuResponse> menuResponse = new ArrayList<>();                     //Forma convencional
    // for (int i = 0; i < menus.size(); i++) {                                 //Forma convencional
    //   menuResponse.add(MenuResponse.entityToResponse(menus.get(i)));         //Forma convencional
    // }                                                                        //Forma convencional
    // return MenuResponse;                                                     //Forma convencional

    return menus.stream().map(MenuResponse::entityToResponse).collect(Collectors.toList());
  }
}
