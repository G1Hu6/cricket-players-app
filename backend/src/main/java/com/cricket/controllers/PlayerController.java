package com.cricket.controllers;

import com.cricket.dto.PlayerDto;
import com.cricket.exceptions.ResponseNotFoundException;
import com.cricket.repositories.PlayerRepository;
import com.cricket.services.PlayerService;
import lombok.RequiredArgsConstructor;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.Map;
import java.util.Optional;

@RestController
@RequestMapping(path = "players")
@RequiredArgsConstructor
public class PlayerController {

    private final PlayerService playerService;

    @GetMapping
    public ResponseEntity<List<PlayerDto>> getAllPlayers(){
        return ResponseEntity.ok(playerService.getAllPlayers());
    }

    @GetMapping(path = "/v1.0")
    public ResponseEntity<List<PlayerDto>> getAllPlayersByLimitAndSkip(@RequestParam(defaultValue = "10") Integer limit, @RequestParam(defaultValue = "0") Integer skip, @RequestParam(defaultValue = "id") String sortBy){
        return ResponseEntity.ok(playerService.getAllPlayersByLimitAndSkip(limit, skip, sortBy));
    }

    @GetMapping(path = "/{id}")
    public ResponseEntity<PlayerDto> getPlayerById(@PathVariable Long id){
        Optional<PlayerDto> playerDto = playerService.getPlayerById(id);
        return playerDto.map(ResponseEntity::ok).orElseThrow(() -> new ResponseNotFoundException("Player is Not found by id : " + id));
    }

    @PostMapping
    public ResponseEntity<PlayerDto> createNewPlayer(@RequestBody PlayerDto newPlayer){
        return new ResponseEntity<>(playerService.createPlayerById(newPlayer), HttpStatus.CREATED);
    }

    @PutMapping(path = "/{id}")
    public ResponseEntity<PlayerDto> updatePlayerById(@RequestBody PlayerDto playerDto,@PathVariable Long id){
        return ResponseEntity.ok(playerService.updatePlayerById(playerDto,id));
    }

    @PatchMapping(path = "/{id}")
    public ResponseEntity<PlayerDto> partiallyUpdatePlayer(@RequestBody Map<String, Object> updates, @PathVariable Long id){
        return ResponseEntity.ok(playerService.partiallyUpdatePlayerById(updates, id));
    }

    @DeleteMapping(path = "/{id}")
    public ResponseEntity<Boolean> deletePlayer(@PathVariable Long id){
        return ResponseEntity.ok(playerService.deletePlayerById(id));
    }
}
