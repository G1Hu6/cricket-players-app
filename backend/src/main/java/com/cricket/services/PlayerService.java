package com.cricket.services;

import com.cricket.dto.PlayerDto;
import com.cricket.repositories.PlayerRepository;
import lombok.RequiredArgsConstructor;
import org.modelmapper.ModelMapper;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@RequiredArgsConstructor
public class PlayerService {

    private final PlayerRepository playerRepository;
    private final ModelMapper modelMapper;

    public List<PlayerDto> getAllPlayers(){
        return playerRepository.findAll().stream()
                .map(playerEntity -> modelMapper.map(playerEntity, PlayerDto.class) )
                .toList();
    }
}
