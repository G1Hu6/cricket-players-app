package com.cricket.entities;

import jakarta.persistence.*;
import lombok.*;
import org.hibernate.annotations.CreationTimestamp;

import java.time.LocalDateTime;


@Setter
@Getter
@NoArgsConstructor
@AllArgsConstructor
@Builder
@Entity
@Table(name = "players")
public class PlayerEntity {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    private String name;

    private String country;

    @Column(length = 4000)
    private String imageUrl;

    private String positions;

    private Integer runs;

    private Double strikeRate;

    @CreationTimestamp
    private LocalDateTime updatedAt;
}
