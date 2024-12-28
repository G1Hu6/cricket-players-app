package com.cricket.dto;

import com.fasterxml.jackson.annotation.JsonProperty;
import jakarta.persistence.Column;
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

    @Column(length = 4000)
    private String imageUrl;

    private String positions;

    private Integer runs;

    private Double strikeRate;

    private LocalDateTime updatedAt;
}
