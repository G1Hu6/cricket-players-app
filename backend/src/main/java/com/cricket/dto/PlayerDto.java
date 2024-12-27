package com.cricket.dto;

import lombok.*;
import org.hibernate.annotations.CreationTimestamp;

import java.time.LocalDateTime;

@Setter
@Getter
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class PlayerDto {

    private Long id;

    private String name;

    private String country;

    private String imageUrl;

    private String position;

    private Integer runs;

    private Double strikeRate;

    private LocalDateTime updatedAt;
}
