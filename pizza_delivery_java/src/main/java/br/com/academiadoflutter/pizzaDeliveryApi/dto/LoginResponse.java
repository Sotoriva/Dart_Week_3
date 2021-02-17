package br.com.academiadoflutter.pizzaDeliveryApi.dto;

import br.com.academiadoflutter.pizzaDeliveryApi.entities.UserE;
import lombok.Data;

@Data
public class LoginResponse {
  private Long id;
  private String name;
  private String email;

  public static LoginResponse entityToResponse(UserE user) {
    final var userResp = new LoginResponse();
    userResp.setId(user.getId());
    userResp.setName(user.getName());
    userResp.setEmail(user.getEmail());
    return userResp;
  }
}
