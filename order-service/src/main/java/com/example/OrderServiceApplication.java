package com.example;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.web.bind.annotation.*;
import java.util.*;

@SpringBootApplication
@RestController
public class OrderServiceApplication {
  public static void main(String[] args){ SpringApplication.run(OrderServiceApplication.class,args); }

  @GetMapping("/health")
  public Map<String,String> health(){ return Map.of("status","ok"); }

  @GetMapping("/orders")
  public List<Map<String,Object>> orders(){
    return List.of(Map.of("orderId",1,"item","ECG","patientId",1));
  }
}
