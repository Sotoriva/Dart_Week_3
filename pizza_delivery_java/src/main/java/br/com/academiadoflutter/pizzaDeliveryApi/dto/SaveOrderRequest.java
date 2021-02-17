package br.com.academiadoflutter.pizzaDeliveryApi.dto;

import java.util.List;

import lombok.Data;

@Data
public class SaveOrderRequest {
  private Long userId;
  private String address;
  private String paymentType;
  private List<Long> itemsId;
}
