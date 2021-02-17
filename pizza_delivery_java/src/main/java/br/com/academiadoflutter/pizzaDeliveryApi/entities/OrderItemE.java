package br.com.academiadoflutter.pizzaDeliveryApi.entities;

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
@Table(name = "pedido_item")
@Getter
@Setter
public class OrderItemE {
  @Id
  @GeneratedValue(strategy = GenerationType.IDENTITY)
  @Column(name = "id_pedido_item")
  private Long id;
  @ManyToOne
  @JoinColumn(name = "id_cardapio_grupo_item")
  private MenuItemE menu;
  @ManyToOne
  @JoinColumn(name = "id_pedido")
  private OrderE order;
}
