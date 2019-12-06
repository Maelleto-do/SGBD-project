-- ============================================================
--    delete data (not tables)
-- ============================================================

delete from games ;
delete from plays ;
delete from decks ;
delete from POSSESSIONS ;
delete from JOUEURS ;
delete from VERSIONS ;
delete from CARTES ;

commit ;

-- ============================================================
--    populate tables
-- ============================================================

-- CARDS

alter table CARTES AUTO_INCREMENT = 1;
insert into CARTES values (NULL, 'Lancephorhynchus', 'Weird dragon', 'Wind', 2500, 800) ;
insert into CARTES values (NULL, 'Edge Imp Sabres',  'It''s an imp', 'Dark', 1200, 800) ;
insert into CARTES values (NULL, 'Qliphort Carrier', 'Strange name', 'Earth', 2400, 1000) ;
insert into CARTES values (NULL, 'Qliphort Helix', 'Carrier''s brother', 'Earth', 2400, 1000)  ;
insert into CARTES values (NULL, 'Taotie, Shadow of the Yang Zing', 'Dog', 'Dark', 2200, 0) ;
insert into CARTES values (NULL, 'Machina Megaform', 'Big robot', 'Eath', 2600, 1500) ;
insert into CARTES values (NULL, 'Rescue Hamster', 'Cute', 'Earth', 300, 100) ;
insert into CARTES values (NULL, 'First of the Dragons', 'Dragon fusion', 'Dark', 2700, 2000) ;
insert into CARTES values (NULL, 'Herald of the Arc Light', 'Fairy synchro', 'Light', 600, 1000) ;
insert into CARTES values (NULL, '1st movement solo', 'Summon something', 'Spell', 0, 0) ;
insert into CARTES values (NULL, 'El Shaddoll Fusion', 'It''s a fusion', 'Spell', 0, 0) ;
insert into CARTES values (NULL, 'First Lake of the Burning Abyss', 'It''s a trap!', 'Trap', 0, 0) ;
insert into CARTES values (NULL, 'Number 39: Utopia Beyond', 'Warrior', 'Light', 3000, 2500) ;
insert into CARTES values (NULL, 'CXyz Barian Hope', 'Warrior', 'Light', 0, 0) ;

commit ;

-- VERSIONS

alter table VERSIONS AUTO_INCREMENT = 1;
insert into VERSIONS values (NULL, 1, 'NORMAL', 5, 2000) ;
insert into VERSIONS values (NULL, 2, 'NORMAL', 5, 5000) ;
insert into VERSIONS values (NULL, 3, 'NORMAL', 5, 10000) ;
insert into VERSIONS values (NULL, 4, 'NORMAL', 5, 2000) ;
insert into VERSIONS values (NULL, 5, 'NORMAL', 5, 7000) ;
insert into VERSIONS values (NULL, 6, 'NORMAL', 5, 8000) ;
insert into VERSIONS values (NULL, 7, 'NORMAL', 5, 2000) ;
insert into VERSIONS values (NULL, 8, 'NORMAL', 5, 9000) ;
insert into VERSIONS values (NULL, 9, 'NORMAL', 5, 2000) ;
insert into VERSIONS values (NULL, 10, 'NORMAL', 5, 2000) ;
insert into VERSIONS values (NULL, 11, 'NORMAL', 5, 6000) ;
insert into VERSIONS values (NULL, 12, 'NORMAL', 5, 7000) ;
insert into VERSIONS values (NULL, 13, 'NORMAL', 5, 3000) ;
insert into VERSIONS values (NULL, 14, 'NORMAL', 5, 4000) ;
insert into VERSIONS values (NULL, 1, 'SHINY', 20, 1000) ;
insert into VERSIONS values (NULL, 2, 'SHINY', 30, 1000) ;
insert into VERSIONS values (NULL, 3, 'SHINY', 50, 1000) ;
insert into VERSIONS values (NULL, 4, 'SHINY', 39, 1000) ;
insert into VERSIONS values (NULL, 5, 'SHINY', 100, 1000) ;

commit ;

-- JOUEURS

insert into JOUEURS values ('Matodo', 'Maelle', 'Toy-Riont--Le-Dosseur') ;
insert into JOUEURS values ('Boytus', 'Lucas', 'Henry') ; 
insert into JOUEURS values ('Toastation', 'Melvin', 'Even') ;
insert into JOUEURS values ('Gouvernathor', 'Pierre', 'Tavia') ; 

commit ;

-- POSSESSIONS 

alter table POSSESSIONS AUTO_INCREMENT = 1;
insert into POSSESSIONS values (NULL, 'Matodo', 1, '2019-09-28', 'NEUF', NULL, NULL, 90) ;
insert into POSSESSIONS values (NULL, 'Matodo', 6, '2019-02-12', 'NEUF', '2019-06-08', 9, 96) ;
insert into POSSESSIONS values (NULL, 'Matodo', 4, '2019-09-28', 'NEUF', NULL, NULL, 90) ;
insert into POSSESSIONS values (NULL, 'Matodo', 17, '2019-09-28', 'OCCASION', NULL, NULL, 40) ;
insert into POSSESSIONS values (NULL, 'Matodo', 10, '2019-09-28', 'OCCASION', NULL, NULL, 70) ;
insert into POSSESSIONS values (NULL, 'Matodo', 11, '2019-09-28', 'NEUF', NULL, NULL, 70) ;
insert into POSSESSIONS values (NULL, 'Matodo', 14, '2019-01-01', 'OCCASION', '2019-04-6', -1, 20) ;


-- -- ============================================================
-- --    verification des donnees
-- -- ============================================================

select count(*),'= 14 ?','ACTEUR' from CARTES 
union
select count(*),'= 19 ?','FILM' from VERSIONS 
commit ; 