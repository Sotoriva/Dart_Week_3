package br.com.academiadoflutter.pizzaDeliveryApi.view_models;

import java.util.List;

import lombok.Data;

@Data
public class SaveOrderInputModel {
  private Long userId;
  private String address;
  private String paymentType;
  private List<Long> itemsId;
}
