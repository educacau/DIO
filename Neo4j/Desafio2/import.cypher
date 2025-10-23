// ─── CRIAR ÍNDICES ─────────────────────────────────────────────────────
CREATE INDEX FOR (u:Usuário) ON (u.id);
CREATE INDEX FOR (a:Artista) ON (a.id);
CREATE INDEX FOR (b:Banda) ON (b.id);
CREATE INDEX FOR (m:Música) ON (m.id);
CREATE INDEX FOR (g:Gênero) ON (g.nome);

// ─── NÓS: Usuários ──────────────────────────────────────────────────
LOAD CSV WITH HEADERS FROM 'https://raw.githubusercontent.com/educacau/DIO/main/Neo4j/Desafio2/Base/usuarios.csv' AS row
CREATE (:Usuário {
  id: toInteger(row.id),
  nome: row.nome,
  idade: toInteger(row.idade),
  pais: row.pais
});

// ─── NÓS: Gêneros ──────────────────────────────────────────────────
LOAD CSV WITH HEADERS FROM 'https://raw.githubusercontent.com/educacau/DIO/main/Neo4j/Desafio2/Base/generos.csv' AS row
CREATE (:Gênero {
  nome: row.nome
});

// ─── NÓS: Artistas ─────────────────────────────────────────────────
LOAD CSV WITH HEADERS FROM 'https://raw.githubusercontent.com/educacau/DIO/main/Neo4j/Desafio2/Base/artistas.csv' AS row
CREATE (:Artista {
  id: toInteger(row.id),
  nome: row.nome,
  pais: row.pais
});

// ─── NÓS: Bandas ─────────────────────────────────────────────────
LOAD CSV WITH HEADERS FROM 'https://raw.githubusercontent.com/educacau/DIO/main/Neo4j/Desafio2/Base/bandas.csv' AS row
CREATE (:Banda {
  id: toInteger(row.id),
  nome: row.nome,
  ano_formacao: toInteger(row.ano_formacao),
  pais: row.pais
});

// ─── NÓS: Músicas ─────────────────────────────────────────────────
LOAD CSV WITH HEADERS FROM 'https://raw.githubusercontent.com/educacau/DIO/main/Neo4j/Desafio2/Base/musicas.csv' AS row
CREATE (:Música {
  id: toInteger(row.id),
  titulo: row.titulo,
  ano: toInteger(row.ano),
  duracao: toInteger(row.duracao),
  popularidade: toInteger(row.popularidade)
});

// ─── REL: Artista -> Banda (MEMBRO_DE) ─────────────────────────────
LOAD CSV WITH HEADERS FROM 'https://raw.githubusercontent.com/educacau/DIO/main/Neo4j/Desafio2/Base/artista_banda.csv' AS row
MATCH (a:Artista {id: toInteger(row.artista_id)}), (b:Banda {id: toInteger(row.banda_id)})
CREATE (a)-[:MEMBRO_DE]->(b);

// ─── REL: Banda -> Música (LANÇOU) ────────────────────────────────
LOAD CSV WITH HEADERS FROM 'https://raw.githubusercontent.com/educacau/DIO/main/Neo4j/Desafio2/Base/banda_musica.csv' AS row
MATCH (b:Banda {id: toInteger(row.banda_id)}), (m:Música {id: toInteger(row.musica_id)})
CREATE (b)-[:LANÇOU]->(m);

// ─── REL: Música -> Gênero (PERTENCE_A) ───────────────────────────
LOAD CSV WITH HEADERS FROM 'https://raw.githubusercontent.com/educacau/DIO/main/Neo4j/Desafio2/Base/musica_genero.csv' AS row
MATCH (m:Música {id: toInteger(row.musica_id)}), (g:Gênero {nome: row.genero})
CREATE (m)-[:PERTENCE_A]->(g);

// ─── REL: Usuário -> Música (OUVIU) ───────────────────────────────
LOAD CSV WITH HEADERS FROM 'https://raw.githubusercontent.com/educacau/DIO/main/Neo4j/Desafio2/Base/usuario_ouviu.csv' AS row
MATCH (u:Usuário {id: toInteger(row.usuario_id)}), (m:Música {id: toInteger(row.musica_id)})
CREATE (u)-[:OUVIU {vezes: toInteger(row.vezes)}]->(m);

// ─── REL: Usuário -> Gênero (GOSTA_DE) ───────────────────────────
LOAD CSV WITH HEADERS FROM 'https://raw.githubusercontent.com/educacau/DIO/main/Neo4j/Desafio2/Base/usuario_gosta_genero.csv' AS row
MATCH (u:Usuário {id: toInteger(row.usuario_id)}), (g:Gênero {nome: row.genero})
CREATE (u)-[:GOSTA_DE]->(g);

// ─── REL: Usuário -> Usuário (SEGUE) ─────────────────────────────
LOAD CSV WITH HEADERS FROM 'https://raw.githubusercontent.com/educacau/DIO/main/Neo4j/Desafio2/Base/usuario_segue.csv' AS row
MATCH (u1:Usuário {id: toInteger(row.usuario_origem)}), (u2:Usuário {id: toInteger(row.usuario_destino)})
CREATE (u1)-[:SEGUE]->(u2);
