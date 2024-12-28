package com.cricket.services;

import com.cricket.dto.PlayerDto;
import com.cricket.entities.PlayerEntity;
import com.cricket.exceptions.ResponseNotFoundException;
import com.cricket.repositories.PlayerRepository;
import lombok.RequiredArgsConstructor;
import org.modelmapper.ModelMapper;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Service;
import org.springframework.util.ReflectionUtils;

import java.lang.reflect.Field;
import java.util.List;
import java.util.Map;
import java.util.Optional;

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

    public List<PlayerDto> getAllPlayersByLimitAndSkip(Integer limit, Integer skip, String sortBy){
        Pageable pageable = PageRequest.of(0, limit, Sort.by(Sort.Direction.ASC, sortBy));
        return playerRepository.findByIdGreaterThan(skip , pageable).stream()
                .map(playerEntity -> modelMapper.map(playerEntity, PlayerDto.class))
                .toList();
    }


    public Optional<PlayerDto> getPlayerById(Long id){
        return playerRepository.findById(id).map(
                playerEntity -> modelMapper.map(playerEntity, PlayerDto.class)
        );
    }

    public PlayerDto createPlayerById(PlayerDto newPlayer){
        return modelMapper.map(playerRepository.save(modelMapper.map(newPlayer, PlayerEntity.class)), PlayerDto.class);
    }

    public PlayerDto updatePlayerById(PlayerDto toBeUpdatePlayer, Long id){
        isExistsById(id);
        PlayerEntity playerEntity = modelMapper.map(toBeUpdatePlayer, PlayerEntity.class);
        playerEntity.setId(id);
        return modelMapper.map(playerRepository.save(playerEntity), PlayerDto.class);
    }

    public PlayerDto partiallyUpdatePlayerById(Map<String, Object> updates, Long id){
        isExistsById(id);
        PlayerEntity playerEntity = playerRepository.findById(id).get();
        updates.forEach((field, value) ->{
                          Field toBeUpdateField = ReflectionUtils.findField(PlayerEntity.class, field);
            if(toBeUpdateField != null){
                 toBeUpdateField.setAccessible(true);
                 ReflectionUtils.setField(toBeUpdateField, playerEntity, value);
            }
        });
        return modelMapper.map(playerEntity, PlayerDto.class);
    }

    public boolean deletePlayerById(Long id){
        isExistsById(id);
        playerRepository.deleteById(id);
        return true;
    }

    public void isExistsById(Long id){
        boolean isExists = playerRepository.existsById(id);
        if(!isExists){
            throw new ResponseNotFoundException("Player not exists by id : " + id);
        }
    }
}
