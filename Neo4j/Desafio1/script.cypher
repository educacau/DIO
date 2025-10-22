MATCH (n) DETACH DELETE n;
CREATE
  (ana:User {name:'Ana Martins'}),
  (bruno:User {name:'Bruno Silva'}),
  (carla:User {name:'Carla Moreira'}),
  (diego:User {name:'Diego Santos'}),
  (elisa:User {name:'Elisa Ferreira'}),
  (felipe:User {name:'Felipe Rocha'}),
  (gabriela:User {name:'Gabriela Nunes'}),
  (henrique:User {name:'Henrique Costa'}),
  (isabela:User {name:'Isabela Duarte'}),
  (joao:User {name:'João Almeida'});


CREATE
  (tom:Actor {name:'Tom Hanks'}),
  (viola:Actor {name:'Viola Davis'}),
  (denzel:Actor {name:'Denzel Washington'}),
  (zendaya:Actor {name:'Zendaya'}),
  (ryan:Actor {name:'Ryan Gosling'}),
  (margot:Actor {name:'Margot Robbie'}),
  (adam:Actor {name:'Adam Driver'}),
  (emma:Actor {name:'Emma Stone'}),
  (pedro:Actor {name:'Pedro Pascal'}),
  (florence:Actor {name:'Florence Pugh'});


CREATE
  (nolan:Director {name:'Christopher Nolan'}),
  (greta:Director {name:'Greta Gerwig'}),
  (denis:Director {name:'Denis Villeneuve'}),
  (jordan:Director {name:'Jordan Peele'}),
  (sofia:Director {name:'Sofia Coppola'}),
  (bong:Director {name:'Bong Joon-ho'}),
  (ridley:Director {name:'Ridley Scott'}),
  (barry:Director {name:'Barry Jenkins'}),
  (taika:Director {name:'Taika Waititi'}),
  (ava:Director {name:'Ava DuVernay'});


CREATE
  (f1:Movie {title:'Ecos do Amanhã'}),
  (f2:Movie {title:'Sombras de Marte'}),
  (f3:Movie {title:'O Último Horizonte'}),
  (f4:Movie {title:'Cidade Submersa'}),
  (f5:Movie {title:'A Promessa de Vênus'}),
  (f6:Movie {title:'Código da Alma'}),
  (f7:Movie {title:'Reflexos de Prata'}),
  (f8:Movie {title:'Horizonte Infinito'}),
  (f9:Movie {title:'O Arquiteto de Sonhos'}),
  (f10:Movie {title:'Chamas do Silêncio'});


CREATE
  (s1:Serie {title:'Noite Eterna'}),
  (s2:Serie {title:'O Quinto Elemento'}),
  (s3:Serie {title:'Céus de Fogo'}),
  (s4:Serie {title:'Linha do Tempo'}),
  (s5:Serie {title:'As Sombras de Avalon'}),
  (s6:Serie {title:'O Guardião do Norte'}),
  (s7:Serie {title:'Fragmentos da Realidade'}),
  (s8:Serie {title:'Círculo das Chamas'}),
  (s9:Serie {title:'Vozes do Passado'}),
  (s10:Serie {title:'O Último Refúgio'});


CREATE
  (g1:Genre {name:'Ficção científica'}),
  (g2:Genre {name:'Drama'}),
  (g3:Genre {name:'Ação'}),
  (g4:Genre {name:'Romance'}),
  (g5:Genre {name:'Suspense'});


CREATE
  (tom)-[:ACTED_IN]->(f1),
  (viola)-[:ACTED_IN]->(f2),
  (denzel)-[:ACTED_IN]->(f3),
  (zendaya)-[:ACTED_IN]->(f4),
  (ryan)-[:ACTED_IN]->(f5),
  (margot)-[:ACTED_IN]->(f6),
  (adam)-[:ACTED_IN]->(f7),
  (emma)-[:ACTED_IN]->(f8),
  (pedro)-[:ACTED_IN]->(f9),
  (florence)-[:ACTED_IN]->(f10);


CREATE
  (nolan)-[:DIRECTED]->(f3),
  (greta)-[:DIRECTED]->(f6),
  (denis)-[:DIRECTED]->(f1),
  (jordan)-[:DIRECTED]->(f2),
  (sofia)-[:DIRECTED]->(f4),
  (bong)-[:DIRECTED]->(f5),
  (ridley)-[:DIRECTED]->(f7),
  (barry)-[:DIRECTED]->(f8),
  (taika)-[:DIRECTED]->(f9),
  (ava)-[:DIRECTED]->(f10);


CREATE
  (f1)-[:IN_GENRE]->(g1),
  (f2)-[:IN_GENRE]->(g5),
  (f3)-[:IN_GENRE]->(g1),
  (f4)-[:IN_GENRE]->(g2),
  (f5)-[:IN_GENRE]->(g4),
  (f6)-[:IN_GENRE]->(g2),
  (f7)-[:IN_GENRE]->(g5),
  (f8)-[:IN_GENRE]->(g1),
  (f9)-[:IN_GENRE]->(g4),
  (f10)-[:IN_GENRE]->(g2);


CREATE
  (s1)-[:IN_GENRE]->(g2),
  (s2)-[:IN_GENRE]->(g1),
  (s3)-[:IN_GENRE]->(g3),
  (s4)-[:IN_GENRE]->(g1),
  (s5)-[:IN_GENRE]->(g4),
  (s6)-[:IN_GENRE]->(g2),
  (s7)-[:IN_GENRE]->(g5),
  (s8)-[:IN_GENRE]->(g3),
  (s9)-[:IN_GENRE]->(g2),
  (s10)-[:IN_GENRE]->(g5);


CREATE
  (zendaya)-[:ACTED_IN]->(s2),
  (pedro)-[:ACTED_IN]->(s9),
  (florence)-[:ACTED_IN]->(s10),
  (viola)-[:ACTED_IN]->(s5),
  (ryan)-[:ACTED_IN]->(s7),
  (emma)-[:ACTED_IN]->(s4);

CREATE
  (ava)-[:DIRECTED]->(s8),
  (greta)-[:DIRECTED]->(s6),
  (denis)-[:DIRECTED]->(s2),
  (taika)-[:DIRECTED]->(s10);


CREATE
  (ana)-[:WATCHED {rating:9.1}]->(f1),
  (ana)-[:WATCHED {rating:5}]->(s1),
  (bruno)-[:WATCHED {rating:7.8}]->(f3),
  (bruno)-[:WATCHED {rating:10}]->(s2),
  (carla)-[:WATCHED {rating:4.9}]->(f4),
  (diego)-[:WATCHED {rating:8.6}]->(s5),
  (elisa)-[:WATCHED {rating:9.5}]->(f6),
  (felipe)-[:WATCHED {rating:9.1}]->(s8),
  (gabriela)-[:WATCHED {rating:7.9}]->(f7),
  (henrique)-[:WATCHED {rating:2.1}]->(f10),
  (isabela)-[:WATCHED {rating:9.1}]->(s9),
  (joao)-[:WATCHED {rating:9.1}]->(f2);