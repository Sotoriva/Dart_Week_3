package br.com.academiadoflutter.pizzaDeliveryApi.entities;

import java.math.BigDecimal;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import lombok.Getter;
import lombok.Setter;

@Entity
@Table(name = "cardapio_grupo_item")
@Getter
@Setter
public class MenuItemE {
  @Id
  @GeneratedValue(strategy = GenerationType.IDENTITY)
  @Column(name = "id_cardapio_grupo_item")
  private Long id;
  @Column(name = "nome")
  private String name;
  @Column(name = "valor")
  private BigDecimal price;
  @ManyToOne
  @JoinColumn(name = "id_cardapio_grupo")
  private MenuE menu;
}
