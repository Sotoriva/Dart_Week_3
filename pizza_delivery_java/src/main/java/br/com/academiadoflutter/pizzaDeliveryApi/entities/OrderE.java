package br.com.academiadoflutter.pizzaDeliveryApi.entities;

import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;

import lombok.Getter;
import lombok.Setter;

@Entity
@Table(name = "pedido")
@Getter
@Setter
public class OrderE {
  @Id
  @GeneratedValue(strategy = GenerationType.IDENTITY)
  @Column(name = "id_pedido")
  private Long id;
  @Column(name = "endereco_entrega")
  private String address;
  @Column(name = "forma_pagamento")
  private String paymentType;
  @ManyToOne
  @JoinColumn(name = "id_usuario")
  private UserE user;
  @OneToMany(cascade = CascadeType.ALL, mappedBy = "order")
  private List<OrderItemE> items;
}
