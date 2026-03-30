/*
 Navicat Premium Dump SQL

 Source Server         : local
 Source Server Type    : PostgreSQL
 Source Server Version : 170004 (170004)
 Source Host           : localhost:5432
 Source Catalog        : access_siga
 Source Schema         : public

 Target Server Type    : PostgreSQL
 Target Server Version : 170004 (170004)
 File Encoding         : 65001

 Date: 29/03/2026 20:47:09
*/


-- ----------------------------
-- Table structure for bpc
-- ----------------------------
DROP TABLE IF EXISTS "public"."bpc";
CREATE TABLE "public"."bpc" (
  "codbpc" float8 NOT NULL,
  "numero_beneficio" float8,
  "nome_titular" varchar(255) COLLATE "pg_catalog"."default",
  "data_nasc" date,
  "endereco" varchar(255) COLLATE "pg_catalog"."default",
  "bairro" varchar(255) COLLATE "pg_catalog"."default",
  "cep" float8,
  "mae" varchar(255) COLLATE "pg_catalog"."default",
  "situacao" varchar(255) COLLATE "pg_catalog"."default",
  "especie_ben" varchar(255) COLLATE "pg_catalog"."default",
  "municipio" varchar(255) COLLATE "pg_catalog"."default",
  "uf" varchar(255) COLLATE "pg_catalog"."default",
  "cadunico" varchar(255) COLLATE "pg_catalog"."default",
  "nis" float8,
  "cpf" float8,
  "cras" varchar(255) COLLATE "pg_catalog"."default"
)
;

-- ----------------------------
-- Table structure for cad_resid_atualizacao
-- ----------------------------
DROP TABLE IF EXISTS "public"."cad_resid_atualizacao";
CREATE TABLE "public"."cad_resid_atualizacao" (
  "cod_cad_res_atual" int4 NOT NULL,
  "cod_cad_resd" int4,
  "data_atualiz" date,
  "tipo_atend" varchar(255) COLLATE "pg_catalog"."default",
  "tecnico_adm" int4,
  "nome_tecadm" varchar(255) COLLATE "pg_catalog"."default"
)
;

-- ----------------------------
-- Table structure for cad_residencia
-- ----------------------------
DROP TABLE IF EXISTS "public"."cad_residencia";
CREATE TABLE "public"."cad_residencia" (
  "cod_fam" int4 NOT NULL DEFAULT 0,
  "data_cad" date,
  "cras_origem" int4,
  "nº_cras" varchar(150) COLLATE "pg_catalog"."default",
  "volante" bool NOT NULL,
  "cod_creas" varchar(150) COLLATE "pg_catalog"."default",
  "cod_ceam" varchar(150) COLLATE "pg_catalog"."default",
  "endereço" varchar(80) COLLATE "pg_catalog"."default",
  "bairro" varchar(65) COLLATE "pg_catalog"."default",
  "uf" varchar(35) COLLATE "pg_catalog"."default",
  "cep" varchar(10) COLLATE "pg_catalog"."default",
  "municipio" varchar(25) COLLATE "pg_catalog"."default",
  "complemento" varchar(50) COLLATE "pg_catalog"."default",
  "referencia" varchar(120) COLLATE "pg_catalog"."default",
  "tel_fixo" varchar(255) COLLATE "pg_catalog"."default",
  "domicilio_urbano" bool NOT NULL,
  "domicilio_rural" bool NOT NULL,
  "abrigo" bool NOT NULL,
  "demanda_espontanea" bool NOT NULL,
  "busca_ativa" bool NOT NULL,
  "enc_unidades_proteção_basica" bool NOT NULL,
  "enc_unidades_proteção_especial" bool NOT NULL,
  "enc_saude" bool NOT NULL,
  "enc_educação" bool NOT NULL,
  "enc_politicas_setoriais" bool NOT NULL,
  "enc_conselho_tutelar" bool NOT NULL,
  "enc_poder_judiciario" bool NOT NULL,
  "enc_defens_publica_mp_delegacias" bool NOT NULL,
  "enc_outros" bool NOT NULL,
  "nome_encaminhador" varchar(100) COLLATE "pg_catalog"."default",
  "tel_encaminhador" varchar(15) COLLATE "pg_catalog"."default",
  "mulher_cf" bool NOT NULL,
  "renda_familiar" varchar(35) COLLATE "pg_catalog"."default",
  "pbf_familia" bool NOT NULL,
  "cadunico" bool NOT NULL,
  "dataatcad" date,
  "outros_programas_priori" varchar(150) COLLATE "pg_catalog"."default",
  "fam_extrema_pb" bool NOT NULL,
  "quilombola" bool NOT NULL,
  "ribeirinha" bool NOT NULL,
  "cigana" bool NOT NULL,
  "indigena_res_aldeia" bool NOT NULL,
  "indigena_nao_resid_aldeia" bool NOT NULL,
  "indigena_etnia" varchar(35) COLLATE "pg_catalog"."default",
  "outra_etnia" varchar(40) COLLATE "pg_catalog"."default",
  "resid_propria" bool NOT NULL,
  "resid_alugada" bool NOT NULL,
  "resid_cedida" bool NOT NULL,
  "resid_ocupada" bool NOT NULL,
  "alvenaria_madeira_aparelhada" bool NOT NULL,
  "madeira_aproveitada_taipa_outros" bool NOT NULL,
  "medidor_compart" bool NOT NULL,
  "sem_medidor" bool NOT NULL,
  "sem_energia_eletrica" bool NOT NULL,
  "medidor_proprio" bool NOT NULL,
  "agua_canalizada" bool NOT NULL,
  "abast_rede_geral" bool NOT NULL,
  "poço_nascente" bool NOT NULL,
  "cisterna_captação" bool NOT NULL,
  "carro_pipa" bool NOT NULL,
  "outra_forma_abast" bool NOT NULL,
  "rede_coletora_esgoto" bool NOT NULL,
  "fossa_septica" bool NOT NULL,
  "fossa_rudimentar" bool NOT NULL,
  "vala_rio_lago" bool NOT NULL,
  "sem_banheiro" bool NOT NULL,
  "coleta_lixo_direta" bool NOT NULL,
  "coleta_lixo_indireta" bool NOT NULL,
  "sem_coleta_lixo" bool NOT NULL,
  "nº_comodos" int4 DEFAULT 0,
  "nº_dormitorios" int4 DEFAULT 0,
  "nº_pessoas_dormitorio" int4 DEFAULT 0,
  "domicilio_tem_acessib_total" bool NOT NULL,
  "domicilio_tem_acessib_interno" bool NOT NULL,
  "domicilio_sem_acessib" bool NOT NULL,
  "area_de_risco" bool NOT NULL,
  "area_dif_acesso_geografico" bool NOT NULL,
  "area_violencia" bool NOT NULL,
  "data_deslig_resid" date,
  "motivo_desl_resid" varchar(120) COLLATE "pg_catalog"."default",
  "pasta_arquivo" varchar(255) COLLATE "pg_catalog"."default"
)
;

-- ----------------------------
-- Table structure for cadunico
-- ----------------------------
DROP TABLE IF EXISTS "public"."cadunico";
CREATE TABLE "public"."cadunico" (
  "identificação" float8 NOT NULL,
  "cras" varchar(255) COLLATE "pg_catalog"."default",
  "cras_região" varchar(255) COLLATE "pg_catalog"."default",
  "refcad" date,
  "codfam" float8,
  "datacad" date,
  "dataatual" date,
  "bairro" varchar(255) COLLATE "pg_catalog"."default",
  "tipo_end" varchar(255) COLLATE "pg_catalog"."default",
  "titulolograd" varchar(255) COLLATE "pg_catalog"."default",
  "logradouro" varchar(255) COLLATE "pg_catalog"."default",
  "numend" float8,
  "complem" varchar(255) COLLATE "pg_catalog"."default",
  "complem1" varchar(255) COLLATE "pg_catalog"."default",
  "cep" float8,
  "referencia" varchar(255) COLLATE "pg_catalog"."default",
  "renda_med" numeric(19,2),
  "rend_total" numeric(19,2),
  "ddd1" float8,
  "tel1" float8,
  "tel2" float8,
  "ddd2" varchar(255) COLLATE "pg_catalog"."default",
  "nomecadunico" varchar(255) COLLATE "pg_catalog"."default",
  "nis" float8,
  "sexo" varchar(255) COLLATE "pg_catalog"."default",
  "dnasc" date,
  "parentesco" float8,
  "raca" float8,
  "mae" varchar(255) COLLATE "pg_catalog"."default",
  "pai" varchar(255) COLLATE "pg_catalog"."default",
  "ufnasc" varchar(255) COLLATE "pg_catalog"."default",
  "cidadenasc" varchar(255) COLLATE "pg_catalog"."default",
  "pais_de_origem" varchar(255) COLLATE "pg_catalog"."default",
  "livro" varchar(255) COLLATE "pg_catalog"."default",
  "termo" varchar(255) COLLATE "pg_catalog"."default",
  "folha" float8,
  "munic_cert" varchar(255) COLLATE "pg_catalog"."default",
  "cpf" float8,
  "rg" float8,
  "dataemisrg" date,
  "ufrg" varchar(255) COLLATE "pg_catalog"."default",
  "orgemissor" varchar(255) COLLATE "pg_catalog"."default",
  "ctps" float8,
  "serie_ctps" float8,
  "dataemissaoctps" date,
  "ufctps" varchar(255) COLLATE "pg_catalog"."default",
  "titulo" float8,
  "zona" float8,
  "seçao" float8,
  "deficiencia" float8,
  "escola" varchar(255) COLLATE "pg_catalog"."default",
  "ufescola" varchar(255) COLLATE "pg_catalog"."default",
  "municescola" varchar(255) COLLATE "pg_catalog"."default",
  "dataentrev" date,
  "escolaridade" varchar(255) COLLATE "pg_catalog"."default"
)
;

-- ----------------------------
-- Table structure for descumprimento
-- ----------------------------
DROP TABLE IF EXISTS "public"."descumprimento";
CREATE TABLE "public"."descumprimento" (
  "identificação" float8,
  "codfamili" varchar(255) COLLATE "pg_catalog"."default",
  "nome_desc" varchar(255) COLLATE "pg_catalog"."default",
  "nis" varchar(255) COLLATE "pg_catalog"."default",
  "nomeresp" varchar(255) COLLATE "pg_catalog"."default",
  "ender" varchar(255) COLLATE "pg_catalog"."default",
  "bairro" varchar(255) COLLATE "pg_catalog"."default",
  "referenc" varchar(255) COLLATE "pg_catalog"."default",
  "cep" varchar(255) COLLATE "pg_catalog"."default",
  "tel" varchar(255) COLLATE "pg_catalog"."default",
  "campo9" varchar(255) COLLATE "pg_catalog"."default",
  "tipodesc" varchar(255) COLLATE "pg_catalog"."default",
  "motivo1" varchar(255) COLLATE "pg_catalog"."default",
  "motivo2" varchar(255) COLLATE "pg_catalog"."default",
  "coddesc" varchar(255) COLLATE "pg_catalog"."default",
  "benef" varchar(255) COLLATE "pg_catalog"."default",
  "mês_de_repercussão" varchar(255) COLLATE "pg_catalog"."default",
  "quantidade_de_suspensões_4" varchar(255) COLLATE "pg_catalog"."default",
  "tempo_em_atenção_prioritária_5" varchar(255) COLLATE "pg_catalog"."default",
  "situação_do_recurso" varchar(255) COLLATE "pg_catalog"."default",
  "motivo_da_avaliação_do_recurso" varchar(255) COLLATE "pg_catalog"."default",
  "acomp_familiar" varchar(255) COLLATE "pg_catalog"."default",
  "cras" varchar(255) COLLATE "pg_catalog"."default"
)
;

-- ----------------------------
-- Table structure for obito
-- ----------------------------
DROP TABLE IF EXISTS "public"."obito";
CREATE TABLE "public"."obito" (
  "nº" float8 NOT NULL,
  "data_da_notificação" date,
  "nome" varchar(255) COLLATE "pg_catalog"."default",
  "sexo" varchar(255) COLLATE "pg_catalog"."default",
  "cpf" float8,
  "data_de_nascimento" date,
  "idade" float8,
  "nome_da_mãe" varchar(255) COLLATE "pg_catalog"."default",
  "endereço" varchar(255) COLLATE "pg_catalog"."default",
  "bairro" varchar(255) COLLATE "pg_catalog"."default",
  "telefone" varchar(255) COLLATE "pg_catalog"."default",
  "gestante" varchar(255) COLLATE "pg_catalog"."default",
  "puerpera" varchar(255) COLLATE "pg_catalog"."default",
  "data_do_óbito" date,
  "cras" varchar(255) COLLATE "pg_catalog"."default"
)
;

-- ----------------------------
-- Table structure for renda_minima
-- ----------------------------
DROP TABLE IF EXISTS "public"."renda_minima";
CREATE TABLE "public"."renda_minima" (
  "identificação" int4 NOT NULL,
  "nome" varchar(255) COLLATE "pg_catalog"."default",
  "rendapc" float8
)
;

-- ----------------------------
-- Table structure for senha_front_end
-- ----------------------------
DROP TABLE IF EXISTS "public"."senha_front_end";
CREATE TABLE "public"."senha_front_end" (
  "código" int4 NOT NULL,
  "nome" varchar(255) COLLATE "pg_catalog"."default" NOT NULL,
  "senha" varchar(255) COLLATE "pg_catalog"."default"
)
;

-- ----------------------------
-- Table structure for tb_acao_comun
-- ----------------------------
DROP TABLE IF EXISTS "public"."tb_acao_comun";
CREATE TABLE "public"."tb_acao_comun" (
  "cod_acao" int4 NOT NULL,
  "data_acao" date,
  "tema" varchar(50) COLLATE "pg_catalog"."default",
  "oficina_cn_contin" bool NOT NULL,
  "acao_comunit" bool NOT NULL,
  "qtd" int4 DEFAULT 0,
  "anexo" bytea,
  "listagem_anexa" text COLLATE "pg_catalog"."default",
  "volante" bool NOT NULL
)
;

-- ----------------------------
-- Table structure for tb_aco_retorno
-- ----------------------------
DROP TABLE IF EXISTS "public"."tb_aco_retorno";
CREATE TABLE "public"."tb_aco_retorno" (
  "cod_aco_retorno" int4 NOT NULL,
  "cod_acomp" int4,
  "data_retorno" date,
  "historico" text COLLATE "pg_catalog"."default",
  "compareceu" bool NOT NULL,
  "obs" varchar(255) COLLATE "pg_catalog"."default"
)
;

-- ----------------------------
-- Table structure for tb_acolhida_col
-- ----------------------------
DROP TABLE IF EXISTS "public"."tb_acolhida_col";
CREATE TABLE "public"."tb_acolhida_col" (
  "cod_acolhida_col" int4 NOT NULL,
  "data_aco_col" date,
  "nome_servidor" int4,
  "nome_aco_col" int4,
  "d_nasc_aco_col" varchar(255) COLLATE "pg_catalog"."default",
  "cpf_aco_col" varchar(255) COLLATE "pg_catalog"."default",
  "rg_aco_col" varchar(255) COLLATE "pg_catalog"."default",
  "cel_aco_col" varchar(255) COLLATE "pg_catalog"."default",
  "dem_bpc_aco_col" bool NOT NULL,
  "dem_inss_aco_col" bool NOT NULL,
  "dem_scfv_aco_col" bool NOT NULL,
  "dem_educ_aco_col" bool NOT NULL,
  "dem_saude_aco_col" bool NOT NULL,
  "dem_justiça_aco_col" bool NOT NULL,
  "dem_benef_mun_aco_col" bool NOT NULL,
  "dem_aux_natal_aco_col" bool NOT NULL,
  "dem_grat_transp_aco_col" bool NOT NULL,
  "dem_rec_jus_aco_col" bool NOT NULL,
  "dem_doc_civil_aco_col" bool NOT NULL,
  "dem_apoio_alim_aco_col" bool NOT NULL,
  "outra_dem_aco_col" bool NOT NULL,
  "espec_outra_aco_col" varchar(255) COLLATE "pg_catalog"."default",
  "enc_rede_sa_aco_col" bool NOT NULL,
  "enc_saude_aco_col" bool NOT NULL,
  "enc_educ_aco_col" bool NOT NULL,
  "enc_semfaz_aco_col" bool NOT NULL,
  "enc_eng_aco_col" bool NOT NULL,
  "enc_op_aco_col" bool NOT NULL,
  "enc_comite_sr" bool NOT NULL,
  "obs" varchar(255) COLLATE "pg_catalog"."default"
)
;

-- ----------------------------
-- Table structure for tb_acomp
-- ----------------------------
DROP TABLE IF EXISTS "public"."tb_acomp";
CREATE TABLE "public"."tb_acomp" (
  "cod_acomp" int4 NOT NULL,
  "data_incl" date,
  "nome" int4,
  "cod_familia" varchar(255) COLLATE "pg_catalog"."default",
  "volante" bool NOT NULL
)
;

-- ----------------------------
-- Table structure for tb_acomp_det
-- ----------------------------
DROP TABLE IF EXISTS "public"."tb_acomp_det";
CREATE TABLE "public"."tb_acomp_det" (
  "cod_acomp_det" int4 NOT NULL,
  "cod_acomp" int4,
  "cod_tecnico" int4,
  "nome_tec" varchar(150) COLLATE "pg_catalog"."default",
  "paf_inicio" date,
  "paf_fim" date,
  "data_desl" date,
  "motivo_deslig" varchar(255) COLLATE "pg_catalog"."default",
  "particular" bool NOT NULL,
  "coletivo" bool NOT NULL,
  "grupo" varchar(150) COLLATE "pg_catalog"."default",
  "extpbz" bool NOT NULL,
  "trabinf" bool NOT NULL,
  "servacol" bool NOT NULL,
  "defic" bool NOT NULL,
  "idoso" bool NOT NULL,
  "gest" bool NOT NULL,
  "criança" bool NOT NULL,
  "adol" bool NOT NULL,
  "alcool_drogas" bool NOT NULL,
  "desc_pbf" bool NOT NULL,
  "conflito_fam" bool NOT NULL,
  "fragil_socio_econ" bool NOT NULL
)
;

-- ----------------------------
-- Table structure for tb_at_coletivo
-- ----------------------------
DROP TABLE IF EXISTS "public"."tb_at_coletivo";
CREATE TABLE "public"."tb_at_coletivo" (
  "cod_coletivo" int4 NOT NULL,
  "data_col" date,
  "volante" bool NOT NULL,
  "gruposcfv" int4,
  "oficineiro" int4,
  "horario" date,
  "fxetariadoscfv" varchar(255) COLLATE "pg_catalog"."default",
  "gruposcf_vext" int4,
  "fxetariadoscfvext" varchar(255) COLLATE "pg_catalog"."default",
  "turnoext" varchar(255) COLLATE "pg_catalog"."default",
  "grupos_paif" bool NOT NULL,
  "of_sescfv" bool NOT NULL,
  "atividade_scfv" bool NOT NULL,
  "mediacoes_paif" bool NOT NULL,
  "tema" varchar(150) COLLATE "pg_catalog"."default",
  "0a5interno" bool NOT NULL,
  "6a11interno" bool NOT NULL,
  "12a14interno" bool NOT NULL,
  "15a17interno" bool NOT NULL,
  "18a29interno" bool NOT NULL,
  "30a59interno" bool NOT NULL,
  "60maisinterno" bool NOT NULL,
  "0a5externo" bool NOT NULL,
  "6a11externo" bool NOT NULL,
  "12a14externo" bool NOT NULL,
  "15a17externo" bool NOT NULL,
  "18a29externo" bool NOT NULL,
  "30a59externo" bool NOT NULL,
  "60maisexterno" bool NOT NULL
)
;

-- ----------------------------
-- Table structure for tb_at_coletivo_det
-- ----------------------------
DROP TABLE IF EXISTS "public"."tb_at_coletivo_det";
CREATE TABLE "public"."tb_at_coletivo_det" (
  "cod_at_colet_det" int4 NOT NULL,
  "cod_coletivo" int4,
  "nome" int4,
  "celular" varchar(150) COLLATE "pg_catalog"."default",
  "nome_visitante" varchar(255) COLLATE "pg_catalog"."default",
  "tel_visitante" varchar(255) COLLATE "pg_catalog"."default"
)
;

-- ----------------------------
-- Table structure for tb_atend
-- ----------------------------
DROP TABLE IF EXISTS "public"."tb_atend";
CREATE TABLE "public"."tb_atend" (
  "cod_atend" int4 NOT NULL,
  "data" date,
  "cod_func" int4,
  "nome_func" varchar(150) COLLATE "pg_catalog"."default",
  "funcao_funcionario" varchar(255) COLLATE "pg_catalog"."default",
  "nome" int4 NOT NULL,
  "acolhida_partic" bool NOT NULL,
  "at_remoto" bool NOT NULL,
  "acoremoto" bool NOT NULL,
  "volante" bool NOT NULL,
  "vd" bool NOT NULL,
  "estudo_social" bool NOT NULL,
  "acolhida_coletiva" bool NOT NULL,
  "art_instituc" bool NOT NULL,
  "relatorio" bool NOT NULL,
  "vdlfr" bool NOT NULL,
  "vdcdl" bool NOT NULL,
  "vddcp" bool NOT NULL,
  "vddpaf" bool NOT NULL,
  "vdamf" bool NOT NULL,
  "vdfvi" bool NOT NULL,
  "vdamd" bool NOT NULL,
  "vdasf" bool NOT NULL,
  "vdpbf" bool NOT NULL,
  "vdscfv" bool NOT NULL,
  "vdout" bool NOT NULL,
  "qual_vd" varchar(255) COLLATE "pg_catalog"."default",
  "vd_nao_localizada" bool NOT NULL,
  "administrativo" bool NOT NULL,
  "social" bool NOT NULL,
  "psicologico" bool NOT NULL,
  "multidisciplinar" bool NOT NULL,
  "orientador_soc" bool NOT NULL,
  "at_gestao" bool NOT NULL,
  "demanda_bpc" bool NOT NULL,
  "demanda_inss" bool NOT NULL,
  "demanda_scfv" bool NOT NULL,
  "demanda_educ" bool NOT NULL,
  "demanda_saude" bool NOT NULL,
  "demanda_justiça" bool NOT NULL,
  "demanda_benef_mun" bool NOT NULL,
  "demanda_aux_natal" bool NOT NULL,
  "demanda_grat_transp" bool NOT NULL,
  "demanda_doc_civil" bool NOT NULL,
  "demanda_apoio_alim" bool NOT NULL,
  "outra_demanda" bool NOT NULL,
  "especif_outra" varchar(255) COLLATE "pg_catalog"."default",
  "obs" varchar(255) COLLATE "pg_catalog"."default"
)
;

-- ----------------------------
-- Table structure for tb_atual_scfv
-- ----------------------------
DROP TABLE IF EXISTS "public"."tb_atual_scfv";
CREATE TABLE "public"."tb_atual_scfv" (
  "cod_atual" int4 NOT NULL,
  "cod_d_pscfv" int4,
  "data" date,
  "obs" varchar(150) COLLATE "pg_catalog"."default"
)
;

-- ----------------------------
-- Table structure for tb_aval_acomp
-- ----------------------------
DROP TABLE IF EXISTS "public"."tb_aval_acomp";
CREATE TABLE "public"."tb_aval_acomp" (
  "cod_avaliacao" int4 NOT NULL,
  "cod_acomp" int4,
  "data_aval" date,
  "tecnico" int4,
  "data_inicio" date,
  "ofertas_efetivas_sim" bool NOT NULL,
  "ofertas_efetivas_parcial" bool NOT NULL,
  "ofertas_efetivas_não" bool NOT NULL,
  "encaminham_atendido_sim" bool NOT NULL,
  "encaminham_atendido_parcial" bool NOT NULL,
  "encaminham_atendido_não" bool NOT NULL,
  "reconhec_da_familia_sim" bool NOT NULL,
  "reconhec_da_familia_parcial" bool NOT NULL,
  "reconhec_da_familia_não" bool NOT NULL,
  "houve_agravamento_da_situação_familiar" bool NOT NULL,
  "situação_atual_é_a_mesma_inicial" bool NOT NULL,
  "houve_avanço_da_capacidade_de_enfrentamento" bool NOT NULL,
  "houve_significatico_avanço_para_desligamento" bool NOT NULL,
  "descreva_os_resultados" text COLLATE "pg_catalog"."default"
)
;

-- ----------------------------
-- Table structure for tb_beneficio_emergencial
-- ----------------------------
DROP TABLE IF EXISTS "public"."tb_beneficio_emergencial";
CREATE TABLE "public"."tb_beneficio_emergencial" (
  "cod_benef" int4 NOT NULL,
  "data_benef" date,
  "cod_tecnico" int4,
  "nome_tecnico" varchar(255) COLLATE "pg_catalog"."default",
  "matricula_tec" varchar(255) COLLATE "pg_catalog"."default",
  "nome" int4,
  "cod_fam" varchar(9) COLLATE "pg_catalog"."default",
  "volante" bool NOT NULL,
  "endereço" varchar(70) COLLATE "pg_catalog"."default",
  "bairro" varchar(60) COLLATE "pg_catalog"."default",
  "cpf_pessoa" varchar(25) COLLATE "pg_catalog"."default",
  "rg_pessoa" varchar(25) COLLATE "pg_catalog"."default",
  "tel_pessoa" varchar(15) COLLATE "pg_catalog"."default",
  "cod_cras" int4,
  "nome_cras" varchar(35) COLLATE "pg_catalog"."default",
  "descrever_item" varchar(35) COLLATE "pg_catalog"."default",
  "cod_item" varchar(25) COLLATE "pg_catalog"."default",
  "qtd" int2 DEFAULT 0,
  "apoio_alim" bool NOT NULL,
  "aux_natal" bool NOT NULL,
  "cobertor" bool NOT NULL,
  "colchonete" bool NOT NULL,
  "outro" bool NOT NULL,
  "outro_descrever" varchar(60) COLLATE "pg_catalog"."default",
  "proprio" bool NOT NULL,
  "doação" bool NOT NULL,
  "nome_represent" varchar(90) COLLATE "pg_catalog"."default",
  "tel_represent" varchar(15) COLLATE "pg_catalog"."default",
  "cpf_represent" varchar(15) COLLATE "pg_catalog"."default",
  "rg_represent" varchar(15) COLLATE "pg_catalog"."default"
)
;

-- ----------------------------
-- Table structure for tb_beneficios_municipais
-- ----------------------------
DROP TABLE IF EXISTS "public"."tb_beneficios_municipais";
CREATE TABLE "public"."tb_beneficios_municipais" (
  "cod_benef" int4 NOT NULL,
  "data_insc" date,
  "volante" bool NOT NULL,
  "cod_func" int4,
  "nome_func" varchar(150) COLLATE "pg_catalog"."default",
  "nome" int4,
  "cpf_pessoa" varchar(255) COLLATE "pg_catalog"."default",
  "celularpessoa" varchar(150) COLLATE "pg_catalog"."default",
  "responsavel" varchar(255) COLLATE "pg_catalog"."default",
  "cpf_responsavel" varchar(255) COLLATE "pg_catalog"."default",
  "tipo_beneficio" varchar(255) COLLATE "pg_catalog"."default",
  "obs" varchar(255) COLLATE "pg_catalog"."default",
  "anexo" bytea,
  "data_desl" date,
  "data_susp" date,
  "data_transf" date
)
;

-- ----------------------------
-- Table structure for tb_benf_mun_det
-- ----------------------------
DROP TABLE IF EXISTS "public"."tb_benf_mun_det";
CREATE TABLE "public"."tb_benf_mun_det" (
  "cod_bef_mun_detalhe" int4 NOT NULL,
  "cod_benef" int4,
  "data_do_atendimento" date,
  "ano_de_referencia" varchar(255) COLLATE "pg_catalog"."default",
  "cod_func" int4,
  "nome_func" varchar(150) COLLATE "pg_catalog"."default",
  "tipo_de_atendimento" varchar(255) COLLATE "pg_catalog"."default",
  "cras_de_transferencia" varchar(255) COLLATE "pg_catalog"."default",
  "situação_beneficio" varchar(255) COLLATE "pg_catalog"."default",
  "motivo_desligamento" varchar(255) COLLATE "pg_catalog"."default",
  "motivo_suspensão" varchar(255) COLLATE "pg_catalog"."default",
  "obs" varchar(255) COLLATE "pg_catalog"."default"
)
;

-- ----------------------------
-- Table structure for tb_busca_ativa
-- ----------------------------
DROP TABLE IF EXISTS "public"."tb_busca_ativa";
CREATE TABLE "public"."tb_busca_ativa" (
  "cod_ba" int4 NOT NULL,
  "data_ba" date,
  "volante" bool NOT NULL,
  "origem" varchar(255) COLLATE "pg_catalog"."default",
  "nome" varchar(255) COLLATE "pg_catalog"."default",
  "endereço" varchar(255) COLLATE "pg_catalog"."default",
  "bairro" varchar(65) COLLATE "pg_catalog"."default",
  "tel_fixo" varchar(255) COLLATE "pg_catalog"."default",
  "celular" varchar(255) COLLATE "pg_catalog"."default",
  "referencia" varchar(255) COLLATE "pg_catalog"."default",
  "obs" varchar(255) COLLATE "pg_catalog"."default"
)
;

-- ----------------------------
-- Table structure for tb_busca_ativa_det
-- ----------------------------
DROP TABLE IF EXISTS "public"."tb_busca_ativa_det";
CREATE TABLE "public"."tb_busca_ativa_det" (
  "cod_ba_det" int4 NOT NULL,
  "cod_ba" int4,
  "data_ba" date,
  "tecnico" int4,
  "função" varchar(255) COLLATE "pg_catalog"."default",
  "nao_localizado" bool NOT NULL,
  "motivo_não_localizado" varchar(255) COLLATE "pg_catalog"."default"
)
;

-- ----------------------------
-- Table structure for tb_cad_funcionario
-- ----------------------------
DROP TABLE IF EXISTS "public"."tb_cad_funcionario";
CREATE TABLE "public"."tb_cad_funcionario" (
  "cod_func" int4 NOT NULL,
  "nome" varchar(80) COLLATE "pg_catalog"."default",
  "função_no_sistema" varchar(255) COLLATE "pg_catalog"."default",
  "volante" bool NOT NULL,
  "matrícula" varchar(15) COLLATE "pg_catalog"."default",
  "foto" bytea,
  "estado_civil" varchar(25) COLLATE "pg_catalog"."default",
  "data_de_nascimento" date,
  "sexo" varchar(1) COLLATE "pg_catalog"."default",
  "cpf" varchar(15) COLLATE "pg_catalog"."default",
  "rg" varchar(15) COLLATE "pg_catalog"."default",
  "grau_de_escolaridade" varchar(35) COLLATE "pg_catalog"."default",
  "formação" varchar(35) COLLATE "pg_catalog"."default",
  "registro_do_conselho" varchar(15) COLLATE "pg_catalog"."default",
  "cargo" varchar(50) COLLATE "pg_catalog"."default",
  "vínculo" varchar(18) COLLATE "pg_catalog"."default",
  "carga_horária" int4 DEFAULT 0,
  "e_mail" text COLLATE "pg_catalog"."default",
  "telefone1" varchar(15) COLLATE "pg_catalog"."default",
  "celular" varchar(15) COLLATE "pg_catalog"."default",
  "endereço" varchar(90) COLLATE "pg_catalog"."default",
  "bairro" varchar(35) COLLATE "pg_catalog"."default",
  "cidade" varchar(25) COLLATE "pg_catalog"."default",
  "estado" varchar(2) COLLATE "pg_catalog"."default",
  "dias_de_trabalho" varchar(25) COLLATE "pg_catalog"."default",
  "data_saida" date
)
;

-- ----------------------------
-- Table structure for tb_demanda_reprimida
-- ----------------------------
DROP TABLE IF EXISTS "public"."tb_demanda_reprimida";
CREATE TABLE "public"."tb_demanda_reprimida" (
  "cod_demanda" int4 NOT NULL,
  "data" date,
  "volante" bool NOT NULL,
  "cod_func" int4,
  "nome_funcionario" varchar(150) COLLATE "pg_catalog"."default",
  "nome" int4,
  "celular_pessoa" varchar(150) COLLATE "pg_catalog"."default",
  "d_nasc" date,
  "demanda_scfv_cras" text COLLATE "pg_catalog"."default",
  "0a5" bool NOT NULL,
  "6a11" bool NOT NULL,
  "12a14" bool NOT NULL,
  "15a17" bool NOT NULL,
  "18a29" bool NOT NULL,
  "30a59" bool NOT NULL,
  "60mais" bool NOT NULL,
  "demanda_scfv_atividade" varchar(255) COLLATE "pg_catalog"."default",
  "demanda_cic_6_a_12" bool NOT NULL,
  "demanda_cic_13_a_17" bool NOT NULL,
  "demanda_casa_da_criança_1_a_6" bool NOT NULL,
  "demanda_bmd" bool NOT NULL,
  "demanda_bmi" bool NOT NULL,
  "outra_demanda" text COLLATE "pg_catalog"."default",
  "cestabasica" bool NOT NULL,
  "cobertor" bool NOT NULL,
  "colchonete" bool NOT NULL,
  "filtro" bool NOT NULL,
  "demanda_kit_enxoval" bool NOT NULL,
  "kit_tipo" varchar(255) COLLATE "pg_catalog"."default",
  "dpp" date,
  "obs" varchar(255) COLLATE "pg_catalog"."default",
  "data_saída" date,
  "motivo_saída" varchar(255) COLLATE "pg_catalog"."default",
  "outros_doacao" varchar(255) COLLATE "pg_catalog"."default"
)
;

-- ----------------------------
-- Table structure for tb_diario
-- ----------------------------
DROP TABLE IF EXISTS "public"."tb_diario";
CREATE TABLE "public"."tb_diario" (
  "cod_diario" int4 NOT NULL,
  "grupo" int4,
  "tipo" varchar(255) COLLATE "pg_catalog"."default",
  "fx_etaria" varchar(150) COLLATE "pg_catalog"."default",
  "horario" varchar(255) COLLATE "pg_catalog"."default",
  "dia_semana" varchar(255) COLLATE "pg_catalog"."default",
  "cod_func" int4,
  "nome_oficineiro" varchar(150) COLLATE "pg_catalog"."default",
  "volante" bool NOT NULL
)
;

-- ----------------------------
-- Table structure for tb_diario_det
-- ----------------------------
DROP TABLE IF EXISTS "public"."tb_diario_det";
CREATE TABLE "public"."tb_diario_det" (
  "cod_diario_det" int4 NOT NULL,
  "cod_diario" int4,
  "nome" int4,
  "d_nasc" date
)
;

-- ----------------------------
-- Table structure for tb_encaminhamento
-- ----------------------------
DROP TABLE IF EXISTS "public"."tb_encaminhamento";
CREATE TABLE "public"."tb_encaminhamento" (
  "codenc" int4 NOT NULL,
  "data_enc" date,
  "volante" bool NOT NULL,
  "cod_func" int4,
  "nome_func" varchar(150) COLLATE "pg_catalog"."default",
  "nome" int4,
  "tel1" varchar(255) COLLATE "pg_catalog"."default",
  "tel2" varchar(255) COLLATE "pg_catalog"."default",
  "data_monit" date,
  "servidor_monitor" varchar(150) COLLATE "pg_catalog"."default",
  "monitoramento_sem_exito" bool NOT NULL,
  "atendido" bool NOT NULL,
  "motivo_não" text COLLATE "pg_catalog"."default",
  "descrição_outros_motivos" varchar(150) COLLATE "pg_catalog"."default",
  "obs" varchar(150) COLLATE "pg_catalog"."default",
  "eng" bool NOT NULL,
  "eng1" bool NOT NULL,
  "eng2" bool NOT NULL,
  "eng3" bool NOT NULL,
  "eng4" bool NOT NULL,
  "eng5" bool NOT NULL,
  "eng6" bool NOT NULL,
  "engout" varchar(255) COLLATE "pg_catalog"."default",
  "rsa" bool NOT NULL,
  "rsa5" bool NOT NULL,
  "rsa6" bool NOT NULL,
  "rsa7" bool NOT NULL,
  "rsa8" bool NOT NULL,
  "rsa9" bool NOT NULL,
  "rsa10" bool NOT NULL,
  "motivo_cras" varchar(255) COLLATE "pg_catalog"."default",
  "rsa11" bool NOT NULL,
  "motivo_creas" varchar(255) COLLATE "pg_catalog"."default",
  "rsa12" bool NOT NULL,
  "rsa13" bool NOT NULL,
  "rsa14" bool NOT NULL,
  "rsaoutro" varchar(255) COLLATE "pg_catalog"."default",
  "rs" bool NOT NULL,
  "rs1" bool NOT NULL,
  "rs2" bool NOT NULL,
  "rs3" bool NOT NULL,
  "rs4" bool NOT NULL,
  "rs5" bool NOT NULL,
  "rs6" bool NOT NULL,
  "rs7" bool NOT NULL,
  "rs8" bool NOT NULL,
  "rs9" bool NOT NULL,
  "rs10" bool NOT NULL,
  "rs11" bool NOT NULL,
  "rs12" bool NOT NULL,
  "rs13" bool NOT NULL,
  "rs14" bool NOT NULL,
  "rs15" bool NOT NULL,
  "rs16" bool NOT NULL,
  "rs17" bool NOT NULL,
  "rs18" bool NOT NULL,
  "rs19" bool NOT NULL,
  "rs20" bool NOT NULL,
  "rsoutro" varchar(255) COLLATE "pg_catalog"."default",
  "re" bool NOT NULL,
  "re1" bool NOT NULL,
  "re2" bool NOT NULL,
  "re3" bool NOT NULL,
  "reoutro" varchar(255) COLLATE "pg_catalog"."default",
  "sf" bool NOT NULL,
  "sf1" bool NOT NULL,
  "sf2" bool NOT NULL,
  "sfoutro" varchar(255) COLLATE "pg_catalog"."default",
  "op" bool NOT NULL,
  "op1" bool NOT NULL,
  "op2" bool NOT NULL,
  "op3" bool NOT NULL,
  "op4" bool NOT NULL,
  "op5" bool NOT NULL,
  "op6" bool NOT NULL,
  "op7" bool NOT NULL,
  "op8" bool NOT NULL,
  "op9" bool NOT NULL,
  "op10" bool NOT NULL,
  "op11" bool NOT NULL,
  "op12" bool NOT NULL,
  "op13" bool NOT NULL,
  "op14" bool NOT NULL,
  "op15" bool NOT NULL,
  "op16" bool NOT NULL,
  "op17" bool NOT NULL,
  "op18" bool NOT NULL,
  "op19" bool NOT NULL,
  "op20" bool NOT NULL,
  "opoutros" varchar(255) COLLATE "pg_catalog"."default"
)
;

-- ----------------------------
-- Table structure for tb_gest_det
-- ----------------------------
DROP TABLE IF EXISTS "public"."tb_gest_det";
CREATE TABLE "public"."tb_gest_det" (
  "código" int4 NOT NULL,
  "cod_gestante" int4,
  "data_cad" date,
  "dpp" date,
  "dp_saida" date,
  "kit_enxoval" bool NOT NULL,
  "data_entrega_kit_enxoval" date,
  "kit_masc" bool NOT NULL,
  "kit_fem" bool NOT NULL,
  "obs" varchar(255) COLLATE "pg_catalog"."default",
  "data_desl" date
)
;

-- ----------------------------
-- Table structure for tb_gestante
-- ----------------------------
DROP TABLE IF EXISTS "public"."tb_gestante";
CREATE TABLE "public"."tb_gestante" (
  "cod_gestante" int4 NOT NULL,
  "data_insc" date,
  "nome" int4,
  "celular" varchar(150) COLLATE "pg_catalog"."default",
  "volante" bool NOT NULL
)
;

-- ----------------------------
-- Table structure for tb_grupo
-- ----------------------------
DROP TABLE IF EXISTS "public"."tb_grupo";
CREATE TABLE "public"."tb_grupo" (
  "cod_grupo" int4 NOT NULL,
  "grupo" varchar(150) COLLATE "pg_catalog"."default",
  "fx_etaria" varchar(150) COLLATE "pg_catalog"."default",
  "dia_semana" varchar(150) COLLATE "pg_catalog"."default",
  "horario" date,
  "tipo" varchar(255) COLLATE "pg_catalog"."default",
  "volante" bool NOT NULL
)
;

-- ----------------------------
-- Table structure for tb_grupo_externo
-- ----------------------------
DROP TABLE IF EXISTS "public"."tb_grupo_externo";
CREATE TABLE "public"."tb_grupo_externo" (
  "cod_grupo" int4 NOT NULL,
  "nome_grupo" varchar(255) COLLATE "pg_catalog"."default",
  "fx_etaria_gr" varchar(255) COLLATE "pg_catalog"."default",
  "turno" varchar(255) COLLATE "pg_catalog"."default",
  "volante" bool NOT NULL
)
;

-- ----------------------------
-- Table structure for tb_local_enc
-- ----------------------------
DROP TABLE IF EXISTS "public"."tb_local_enc";
CREATE TABLE "public"."tb_local_enc" (
  "código" int4 NOT NULL,
  "local" varchar(255) COLLATE "pg_catalog"."default",
  "endereço" varchar(255) COLLATE "pg_catalog"."default",
  "telefone" varchar(255) COLLATE "pg_catalog"."default",
  "grupo" varchar(255) COLLATE "pg_catalog"."default",
  "obs" varchar(255) COLLATE "pg_catalog"."default"
)
;

-- ----------------------------
-- Table structure for tb_nome_acolhida
-- ----------------------------
DROP TABLE IF EXISTS "public"."tb_nome_acolhida";
CREATE TABLE "public"."tb_nome_acolhida" (
  "id_nome" int4 NOT NULL,
  "nome" varchar(255) COLLATE "pg_catalog"."default" NOT NULL,
  "d_nasc_nome" date,
  "cpf_nome" varchar(11) COLLATE "pg_catalog"."default",
  "rg_nome" varchar(10) COLLATE "pg_catalog"."default",
  "celular_nome" varchar(11) COLLATE "pg_catalog"."default"
)
;

-- ----------------------------
-- Table structure for tb_of_socio_edu_atualiz
-- ----------------------------
DROP TABLE IF EXISTS "public"."tb_of_socio_edu_atualiz";
CREATE TABLE "public"."tb_of_socio_edu_atualiz" (
  "cod_of_se_atualiz" int4 NOT NULL,
  "cod_of_se_det" int4,
  "data_atual" date
)
;

-- ----------------------------
-- Table structure for tb_of_socio_edu_detalhe
-- ----------------------------
DROP TABLE IF EXISTS "public"."tb_of_socio_edu_detalhe";
CREATE TABLE "public"."tb_of_socio_edu_detalhe" (
  "cod_of_se_det" int4 NOT NULL,
  "data_insc" date,
  "volante" bool NOT NULL,
  "nome" int4,
  "nome_pessoa" varchar(255) COLLATE "pg_catalog"."default",
  "d_nas_pessoa" date,
  "idade" varchar(150) COLLATE "pg_catalog"."default",
  "situação_usuario" varchar(150) COLLATE "pg_catalog"."default",
  "situação_municipal" varchar(255) COLLATE "pg_catalog"."default",
  "data_desl" date,
  "motivo_desl" varchar(150) COLLATE "pg_catalog"."default",
  "encaminhado" bool NOT NULL,
  "onde" varchar(150) COLLATE "pg_catalog"."default",
  "obs" varchar(150) COLLATE "pg_catalog"."default",
  "beneficio_munic" bool NOT NULL,
  "bpc" bool NOT NULL,
  "pbf" bool NOT NULL,
  "cadunico" bool NOT NULL,
  "nome_respons_criança" varchar(150) COLLATE "pg_catalog"."default",
  "cpf_resp" varchar(255) COLLATE "pg_catalog"."default",
  "cel_resp" varchar(255) COLLATE "pg_catalog"."default",
  "parentesco_resp" varchar(25) COLLATE "pg_catalog"."default",
  "aco" bool NOT NULL,
  "paf" bool NOT NULL,
  "motivo_busca_serviço" varchar(255) COLLATE "pg_catalog"."default",
  "qual_politica_encaminhou" varchar(255) COLLATE "pg_catalog"."default",
  "cuidador_exclusivo" bool NOT NULL,
  "cuidador_exclusivo_trabalha" bool NOT NULL,
  "familia_dentro_perfil" bool NOT NULL,
  "vacina_em_dia" bool NOT NULL,
  "medicamentos" bool NOT NULL,
  "quais_medicamentos" varchar(70) COLLATE "pg_catalog"."default",
  "tratamento_saude" bool NOT NULL,
  "qual_tratamento" varchar(70) COLLATE "pg_catalog"."default",
  "alergia" bool NOT NULL,
  "qual_alergia" varchar(70) COLLATE "pg_catalog"."default",
  "pediatra" varchar(70) COLLATE "pg_catalog"."default",
  "autorizado_a_sair_sozinho" bool NOT NULL,
  "quem_busca" varchar(80) COLLATE "pg_catalog"."default",
  "pessoa_emergencia" varchar(90) COLLATE "pg_catalog"."default",
  "tel_emergencia" varchar(15) COLLATE "pg_catalog"."default",
  "cras_da_oficina_socioeducativa" varchar(255) COLLATE "pg_catalog"."default"
)
;

-- ----------------------------
-- Table structure for tb_pbf08
-- ----------------------------
DROP TABLE IF EXISTS "public"."tb_pbf08";
CREATE TABLE "public"."tb_pbf08" (
  "codpbf" float8 NOT NULL,
  "cpftitular" varchar(255) COLLATE "pg_catalog"."default",
  "titular" varchar(255) COLLATE "pg_catalog"."default",
  "dtnasctit" varchar(255) COLLATE "pg_catalog"."default",
  "nistitular" varchar(255) COLLATE "pg_catalog"."default",
  "competfolha" varchar(255) COLLATE "pg_catalog"."default",
  "endereco" text COLLATE "pg_catalog"."default",
  "bairro" varchar(255) COLLATE "pg_catalog"."default",
  "cep" varchar(255) COLLATE "pg_catalog"."default",
  "localidade" varchar(255) COLLATE "pg_catalog"."default",
  "nudomicfamil" varchar(255) COLLATE "pg_catalog"."default",
  "cras" varchar(255) COLLATE "pg_catalog"."default",
  "valor_total" numeric(19,2),
  "codfam" varchar(255) COLLATE "pg_catalog"."default"
)
;

-- ----------------------------
-- Table structure for tb_pessoa
-- ----------------------------
DROP TABLE IF EXISTS "public"."tb_pessoa";
CREATE TABLE "public"."tb_pessoa" (
  "cod_pessoa" int4 NOT NULL,
  "cod_fam" int4,
  "data_cad_pes" date,
  "nome" varchar(125) COLLATE "pg_catalog"."default" NOT NULL,
  "parentesco" varchar(30) COLLATE "pg_catalog"."default",
  "apelido" varchar(50) COLLATE "pg_catalog"."default",
  "nome_mae" varchar(120) COLLATE "pg_catalog"."default",
  "nome_pai" varchar(255) COLLATE "pg_catalog"."default",
  "celular" varchar(255) COLLATE "pg_catalog"."default",
  "tel_recado_detalhes" varchar(255) COLLATE "pg_catalog"."default",
  "nis" varchar(255) COLLATE "pg_catalog"."default",
  "provicn" bool NOT NULL,
  "provirg" bool NOT NULL,
  "provictps" bool NOT NULL,
  "provicpf" bool NOT NULL,
  "provite" bool NOT NULL,
  "cpf" varchar(15) COLLATE "pg_catalog"."default",
  "rg" varchar(255) COLLATE "pg_catalog"."default",
  "orgao_rg" varchar(255) COLLATE "pg_catalog"."default",
  "d_emis_rg" date,
  "cert_livro_folha_termo" varchar(255) COLLATE "pg_catalog"."default",
  "titulo_zona_seçao" varchar(255) COLLATE "pg_catalog"."default",
  "sexo" varchar(6) COLLATE "pg_catalog"."default",
  "raça_cor" varchar(12) COLLATE "pg_catalog"."default",
  "d_nasc" date,
  "idade" varchar(255) COLLATE "pg_catalog"."default",
  "munic_nasc" varchar(255) COLLATE "pg_catalog"."default",
  "uf_nasc" varchar(35) COLLATE "pg_catalog"."default",
  "estado_civil" varchar(20) COLLATE "pg_catalog"."default",
  "autismo" bool NOT NULL,
  "cegueira" bool NOT NULL,
  "baixa_visão" bool NOT NULL,
  "surdez_severa_profunda" bool NOT NULL,
  "surdez_leve_moderada" bool NOT NULL,
  "deficiencia_fisica" bool NOT NULL,
  "defic_mental_intelec" bool NOT NULL,
  "sindrome_down" bool NOT NULL,
  "transt_doença_mental" bool NOT NULL,
  "doenca_cronica" bool NOT NULL,
  "qual_d_cronica" varchar(255) COLLATE "pg_catalog"."default",
  "situação_rua" bool NOT NULL,
  "serv_aco" bool NOT NULL,
  "ler_escrever" bool NOT NULL,
  "freq_escola" bool NOT NULL,
  "escolaridade" varchar(25) COLLATE "pg_catalog"."default",
  "nome_escola" varchar(255) COLLATE "pg_catalog"."default",
  "turno" varchar(255) COLLATE "pg_catalog"."default",
  "ctps" bool NOT NULL,
  "nº_ctps" varchar(255) COLLATE "pg_catalog"."default",
  "condição_ocupação" varchar(50) COLLATE "pg_catalog"."default",
  "bpcd" bool NOT NULL,
  "bpci" bool NOT NULL,
  "renda_sem_programas_sociais" numeric(19,2) DEFAULT 0,
  "renda_per_capita" numeric(19,2) DEFAULT 0,
  "recebe_programa_social" bool NOT NULL,
  "aposentado_pensionista" bool NOT NULL,
  "data_deslig_pes" date,
  "motivo_desl_pes" varchar(120) COLLATE "pg_catalog"."default",
  "email" text COLLATE "pg_catalog"."default"
)
;

-- ----------------------------
-- Table structure for tb_recepção
-- ----------------------------
DROP TABLE IF EXISTS "public"."tb_recepção";
CREATE TABLE "public"."tb_recepção" (
  "cod_recepcao" int4 NOT NULL,
  "data" date,
  "recepção_qtd" int4,
  "cad1_vez" int4 DEFAULT 0,
  "cadatualiz" int4 DEFAULT 0,
  "cadori" int4 DEFAULT 0,
  "gestao" int4 DEFAULT 0,
  "eqtec" int4 DEFAULT 0,
  "acocoletiva" int4 DEFAULT 0,
  "admin" int4 DEFAULT 0,
  "volante" bool NOT NULL
)
;

-- ----------------------------
-- Table structure for tb_reg_sint
-- ----------------------------
DROP TABLE IF EXISTS "public"."tb_reg_sint";
CREATE TABLE "public"."tb_reg_sint" (
  "cod_reg_sint" int4 NOT NULL,
  "cod_acomp" int4,
  "data_reg_sint" date,
  "nome_tecnico" int4,
  "foram_efetivamente_disponibilizadas" varchar(255) COLLATE "pg_catalog"."default",
  "em_relação_aos_encaminhamentos" varchar(255) COLLATE "pg_catalog"."default",
  "a_familia_reconhece_o_serviço_de_aco" varchar(255) COLLATE "pg_catalog"."default",
  "houve_agravamento" bool NOT NULL,
  "a_situação_atual_é_equivalente_à_sit_inicial" bool NOT NULL,
  "houve_avanço_mas_não_justifica_desligamento" bool NOT NULL,
  "houve_significativo_avanço_e_justifica_desligamento" bool NOT NULL,
  "acompanhamento_paif_sem_sucesso_não_aderiu_ao_paf" bool NOT NULL
)
;

-- ----------------------------
-- Table structure for tb_registrar_enc
-- ----------------------------
DROP TABLE IF EXISTS "public"."tb_registrar_enc";
CREATE TABLE "public"."tb_registrar_enc" (
  "codenc" int4 NOT NULL,
  "num_enc" varchar(255) COLLATE "pg_catalog"."default",
  "data_enc" date,
  "cod_func" int4,
  "nome_func" varchar(150) COLLATE "pg_catalog"."default",
  "nome" int4,
  "local_enc" int4,
  "solicita" varchar(255) COLLATE "pg_catalog"."default",
  "tel1" varchar(255) COLLATE "pg_catalog"."default",
  "tel2" varchar(255) COLLATE "pg_catalog"."default",
  "obs" text COLLATE "pg_catalog"."default"
)
;

-- ----------------------------
-- Table structure for tb_reuniao
-- ----------------------------
DROP TABLE IF EXISTS "public"."tb_reuniao";
CREATE TABLE "public"."tb_reuniao" (
  "cod_reuniao" int4 NOT NULL,
  "data" date,
  "assunto" varchar(150) COLLATE "pg_catalog"."default",
  "ass_tecnico" bool NOT NULL,
  "interna" bool NOT NULL,
  "externa" bool NOT NULL,
  "local" varchar(150) COLLATE "pg_catalog"."default",
  "intersetorial" bool NOT NULL,
  "qual" varchar(255) COLLATE "pg_catalog"."default",
  "ata" text COLLATE "pg_catalog"."default",
  "volante" bool NOT NULL
)
;

-- ----------------------------
-- Table structure for tb_reuniao_det
-- ----------------------------
DROP TABLE IF EXISTS "public"."tb_reuniao_det";
CREATE TABLE "public"."tb_reuniao_det" (
  "cod_reuniao_det" int4 NOT NULL,
  "cod_reuniao" int4,
  "nome" varchar(150) COLLATE "pg_catalog"."default",
  "função" varchar(150) COLLATE "pg_catalog"."default",
  "celular" varchar(15) COLLATE "pg_catalog"."default",
  "email" varchar(45) COLLATE "pg_catalog"."default",
  "local_de_trabalho" varchar(50) COLLATE "pg_catalog"."default"
)
;

-- ----------------------------
-- Table structure for tb_scfv_ext_atualiz
-- ----------------------------
DROP TABLE IF EXISTS "public"."tb_scfv_ext_atualiz";
CREATE TABLE "public"."tb_scfv_ext_atualiz" (
  "cod_scfv_ext_atual" int4 NOT NULL,
  "cod_scfve_det" int4,
  "data_atual" date
)
;

-- ----------------------------
-- Table structure for tb_scfv_ext_detalhe
-- ----------------------------
DROP TABLE IF EXISTS "public"."tb_scfv_ext_detalhe";
CREATE TABLE "public"."tb_scfv_ext_detalhe" (
  "cod_scfve_det" int4 NOT NULL,
  "datainscr" date,
  "volante" bool NOT NULL,
  "grupoext" int4,
  "fxetaria" varchar(255) COLLATE "pg_catalog"."default",
  "turno" varchar(255) COLLATE "pg_catalog"."default",
  "unidade" varchar(255) COLLATE "pg_catalog"."default",
  "nome" int4,
  "nome_pessoa" varchar(255) COLLATE "pg_catalog"."default",
  "d_nas_pessoa" date,
  "idade" varchar(150) COLLATE "pg_catalog"."default",
  "situação_usuario" varchar(150) COLLATE "pg_catalog"."default",
  "situação_municipal" varchar(255) COLLATE "pg_catalog"."default",
  "data_desl" date,
  "motivo_desl" varchar(150) COLLATE "pg_catalog"."default",
  "encaminhado" bool NOT NULL,
  "onde" varchar(150) COLLATE "pg_catalog"."default",
  "obs" varchar(150) COLLATE "pg_catalog"."default",
  "beneficio_munic" bool NOT NULL,
  "bpc" bool NOT NULL,
  "pbf" bool NOT NULL,
  "cadunico" bool NOT NULL,
  "nome_respons_criança" varchar(150) COLLATE "pg_catalog"."default",
  "cpf_resp" varchar(255) COLLATE "pg_catalog"."default",
  "cel_resp" varchar(255) COLLATE "pg_catalog"."default",
  "parentesco_resp" varchar(25) COLLATE "pg_catalog"."default",
  "aco" bool NOT NULL,
  "paf" bool NOT NULL,
  "motivo_busca_serviço" varchar(255) COLLATE "pg_catalog"."default",
  "qual_politica_encaminhou" varchar(255) COLLATE "pg_catalog"."default",
  "cuidador_exclusivo" bool NOT NULL,
  "cuidador_exclusivo_trabalha" bool NOT NULL,
  "vacina_em_dia" bool NOT NULL,
  "medicamentos" bool NOT NULL,
  "quais_medicamentos" varchar(70) COLLATE "pg_catalog"."default",
  "tratamento_saude" bool NOT NULL,
  "qual_tratamento" varchar(70) COLLATE "pg_catalog"."default",
  "alergia" bool NOT NULL,
  "qual_alergia" varchar(70) COLLATE "pg_catalog"."default",
  "pediatra" varchar(70) COLLATE "pg_catalog"."default",
  "autorizado_a_sair_sozinho" bool NOT NULL,
  "quem_busca" varchar(80) COLLATE "pg_catalog"."default",
  "pessoa_emergencia" varchar(90) COLLATE "pg_catalog"."default",
  "tel_emergencia" varchar(15) COLLATE "pg_catalog"."default"
)
;

-- ----------------------------
-- Table structure for tb_selecao_benef_munic
-- ----------------------------
DROP TABLE IF EXISTS "public"."tb_selecao_benef_munic";
CREATE TABLE "public"."tb_selecao_benef_munic" (
  "id_selecao" int4 NOT NULL,
  "data_selecao" date,
  "cadastro_nos_equip_semas" bool NOT NULL,
  "solicitou_apoio_alim" bool NOT NULL,
  "nome" int4,
  "data_cad" date,
  "nome_resp" varchar(255) COLLATE "pg_catalog"."default",
  "cpf_respons" varchar(15) COLLATE "pg_catalog"."default",
  "bmd" bool NOT NULL,
  "bmi" bool NOT NULL,
  "bsf" bool NOT NULL,
  "codfam" varchar(255) COLLATE "pg_catalog"."default"
)
;

-- ----------------------------
-- Table structure for tb_unidade
-- ----------------------------
DROP TABLE IF EXISTS "public"."tb_unidade";
CREATE TABLE "public"."tb_unidade" (
  "cod_unidade" int4 NOT NULL,
  "cras" bool NOT NULL,
  "nº_unidade" varchar(15) COLLATE "pg_catalog"."default",
  "nome" varchar(25) COLLATE "pg_catalog"."default",
  "codbarras" bytea,
  "diretor_a" varchar(80) COLLATE "pg_catalog"."default",
  "cargo" varchar(25) COLLATE "pg_catalog"."default",
  "função" varchar(25) COLLATE "pg_catalog"."default",
  "matricula" varchar(7) COLLATE "pg_catalog"."default",
  "endereço" varchar(150) COLLATE "pg_catalog"."default",
  "municipio" varchar(150) COLLATE "pg_catalog"."default",
  "uf" varchar(2) COLLATE "pg_catalog"."default",
  "telefoneunid" varchar(150) COLLATE "pg_catalog"."default",
  "logo" text COLLATE "pg_catalog"."default",
  "rodape" text COLLATE "pg_catalog"."default",
  "img_cartao_suas" text COLLATE "pg_catalog"."default",
  "rma1" text COLLATE "pg_catalog"."default"
)
;

-- ----------------------------
-- Table structure for tb_versao
-- ----------------------------
DROP TABLE IF EXISTS "public"."tb_versao";
CREATE TABLE "public"."tb_versao" (
  "código" int4 NOT NULL,
  "nome_sistema" varchar(255) COLLATE "pg_catalog"."default",
  "versao" varchar(255) COLLATE "pg_catalog"."default",
  "desenvolvedora" varchar(255) COLLATE "pg_catalog"."default",
  "dataultima_atualizacao" date,
  "detalhes" varchar(150) COLLATE "pg_catalog"."default"
)
;

-- ----------------------------
-- Table structure for tb_violacoes
-- ----------------------------
DROP TABLE IF EXISTS "public"."tb_violacoes";
CREATE TABLE "public"."tb_violacoes" (
  "cod_viol" int4 NOT NULL,
  "tecnico_resp" int4,
  "nome_pessoa" int4,
  "cod_fam" varchar(255) COLLATE "pg_catalog"."default",
  "data" date,
  "volante" bool NOT NULL,
  "trab_inf" bool NOT NULL,
  "sup_trab_inf" date,
  "expl_sex" bool NOT NULL,
  "sup_expl_sex" date,
  "abu_viol_sex" bool NOT NULL,
  "sup_abu_viol_sex" date,
  "viol_fis" bool NOT NULL,
  "sup_viol_fis" date,
  "vio_psic" bool NOT NULL,
  "sup_vio_psic" date,
  "negl_idoso" bool NOT NULL,
  "sup_negl_idoso" date,
  "negli_cri" bool NOT NULL,
  "sup_negli_cri" date,
  "negli_pcd" bool NOT NULL,
  "sup_negli_pcd" date,
  "traj_rua" bool NOT NULL,
  "sup_traj_rua" date,
  "traf_pess" bool NOT NULL,
  "sup_traf_pess" date,
  "viol_patr_idoso" bool NOT NULL,
  "sup_viol_patr_idoso" date,
  "viol_patri_pcd" bool NOT NULL,
  "sup_viol_patri_pcd" date,
  "outra" varchar(255) COLLATE "pg_catalog"."default",
  "sup_outra" date
)
;

-- ----------------------------
-- Primary Key structure for table bpc
-- ----------------------------
ALTER TABLE "public"."bpc" ADD CONSTRAINT "codbpc" PRIMARY KEY ("codbpc");

-- ----------------------------
-- Indexes structure for table cad_resid_atualizacao
-- ----------------------------
CREATE INDEX "cad_residencia_cad_resid_atualizacao" ON "public"."cad_resid_atualizacao" USING btree (
  "cod_cad_resd" "pg_catalog"."int4_ops" ASC NULLS LAST
);
CREATE INDEX "tb_cad_funcionario_cad_resid_atualizacao" ON "public"."cad_resid_atualizacao" USING btree (
  "tecnico_adm" "pg_catalog"."int4_ops" ASC NULLS LAST
);

-- ----------------------------
-- Primary Key structure for table cad_resid_atualizacao
-- ----------------------------
ALTER TABLE "public"."cad_resid_atualizacao" ADD CONSTRAINT "primary_key25" PRIMARY KEY ("cod_cad_res_atual");

-- ----------------------------
-- Primary Key structure for table cad_residencia
-- ----------------------------
ALTER TABLE "public"."cad_residencia" ADD CONSTRAINT "primary_key6" PRIMARY KEY ("cod_fam");

-- ----------------------------
-- Primary Key structure for table cadunico
-- ----------------------------
ALTER TABLE "public"."cadunico" ADD CONSTRAINT "identificação2" PRIMARY KEY ("identificação");

-- ----------------------------
-- Indexes structure for table descumprimento
-- ----------------------------
CREATE UNIQUE INDEX "identificação" ON "public"."descumprimento" USING btree (
  "identificação" "pg_catalog"."float8_ops" ASC NULLS LAST
);

-- ----------------------------
-- Indexes structure for table obito
-- ----------------------------
CREATE INDEX "idade" ON "public"."obito" USING btree (
  "idade" "pg_catalog"."float8_ops" ASC NULLS LAST
);

-- ----------------------------
-- Primary Key structure for table obito
-- ----------------------------
ALTER TABLE "public"."obito" ADD CONSTRAINT "nº" PRIMARY KEY ("nº");

-- ----------------------------
-- Primary Key structure for table renda_minima
-- ----------------------------
ALTER TABLE "public"."renda_minima" ADD CONSTRAINT "identificação1" PRIMARY KEY ("identificação");

-- ----------------------------
-- Primary Key structure for table senha_front_end
-- ----------------------------
ALTER TABLE "public"."senha_front_end" ADD CONSTRAINT "primary_key32" PRIMARY KEY ("código");

-- ----------------------------
-- Primary Key structure for table tb_acao_comun
-- ----------------------------
ALTER TABLE "public"."tb_acao_comun" ADD CONSTRAINT "primary_key40" PRIMARY KEY ("cod_acao");

-- ----------------------------
-- Indexes structure for table tb_aco_retorno
-- ----------------------------
CREATE INDEX "tb_acomp_tb_aco_retorno" ON "public"."tb_aco_retorno" USING btree (
  "cod_acomp" "pg_catalog"."int4_ops" ASC NULLS LAST
);

-- ----------------------------
-- Primary Key structure for table tb_aco_retorno
-- ----------------------------
ALTER TABLE "public"."tb_aco_retorno" ADD CONSTRAINT "primary_key31" PRIMARY KEY ("cod_aco_retorno");

-- ----------------------------
-- Primary Key structure for table tb_acolhida_col
-- ----------------------------
ALTER TABLE "public"."tb_acolhida_col" ADD CONSTRAINT "primary_key3" PRIMARY KEY ("cod_acolhida_col");

-- ----------------------------
-- Indexes structure for table tb_acomp
-- ----------------------------
CREATE INDEX "tb_pessoa_tb_acomp" ON "public"."tb_acomp" USING btree (
  "nome" "pg_catalog"."int4_ops" ASC NULLS LAST
);

-- ----------------------------
-- Primary Key structure for table tb_acomp
-- ----------------------------
ALTER TABLE "public"."tb_acomp" ADD CONSTRAINT "primary_key7" PRIMARY KEY ("cod_acomp");

-- ----------------------------
-- Primary Key structure for table tb_acomp_det
-- ----------------------------
ALTER TABLE "public"."tb_acomp_det" ADD CONSTRAINT "primary_key39" PRIMARY KEY ("cod_acomp_det");

-- ----------------------------
-- Primary Key structure for table tb_at_coletivo
-- ----------------------------
ALTER TABLE "public"."tb_at_coletivo" ADD CONSTRAINT "primary_key30" PRIMARY KEY ("cod_coletivo");

-- ----------------------------
-- Indexes structure for table tb_at_coletivo_det
-- ----------------------------
CREATE INDEX "tb_at_coletivo_tb_at_coletivo_det" ON "public"."tb_at_coletivo_det" USING btree (
  "cod_coletivo" "pg_catalog"."int4_ops" ASC NULLS LAST
);
CREATE INDEX "tb_pessoa_tb_at_coletivo_det" ON "public"."tb_at_coletivo_det" USING btree (
  "nome" "pg_catalog"."int4_ops" ASC NULLS LAST
);

-- ----------------------------
-- Primary Key structure for table tb_at_coletivo_det
-- ----------------------------
ALTER TABLE "public"."tb_at_coletivo_det" ADD CONSTRAINT "primary_key10" PRIMARY KEY ("cod_at_colet_det");

-- ----------------------------
-- Indexes structure for table tb_atend
-- ----------------------------
CREATE UNIQUE INDEX "cod_atend" ON "public"."tb_atend" USING btree (
  "cod_atend" "pg_catalog"."int4_ops" ASC NULLS LAST
);
CREATE INDEX "tb_cad_funcionario_tb_atend1" ON "public"."tb_atend" USING btree (
  "cod_func" "pg_catalog"."int4_ops" ASC NULLS LAST
);

-- ----------------------------
-- Primary Key structure for table tb_atend
-- ----------------------------
ALTER TABLE "public"."tb_atend" ADD CONSTRAINT "primary_key35" PRIMARY KEY ("cod_atend");

-- ----------------------------
-- Primary Key structure for table tb_atual_scfv
-- ----------------------------
ALTER TABLE "public"."tb_atual_scfv" ADD CONSTRAINT "primary_key" PRIMARY KEY ("cod_atual");

-- ----------------------------
-- Indexes structure for table tb_aval_acomp
-- ----------------------------
CREATE INDEX "tb_acomp_tb_aval_acomp" ON "public"."tb_aval_acomp" USING btree (
  "cod_acomp" "pg_catalog"."int4_ops" ASC NULLS LAST
);
CREATE INDEX "tb_cad_funcionario_tb_aval_acomp" ON "public"."tb_aval_acomp" USING btree (
  "tecnico" "pg_catalog"."int4_ops" ASC NULLS LAST
);

-- ----------------------------
-- Primary Key structure for table tb_aval_acomp
-- ----------------------------
ALTER TABLE "public"."tb_aval_acomp" ADD CONSTRAINT "primary_key36" PRIMARY KEY ("cod_avaliacao");

-- ----------------------------
-- Indexes structure for table tb_beneficio_emergencial
-- ----------------------------
CREATE INDEX "tb_cad_funcionario_tb_beneficio_emergencial" ON "public"."tb_beneficio_emergencial" USING btree (
  "cod_tecnico" "pg_catalog"."int4_ops" ASC NULLS LAST
);
CREATE INDEX "tb_pessoa_tb_beneficio_emergencial" ON "public"."tb_beneficio_emergencial" USING btree (
  "nome" "pg_catalog"."int4_ops" ASC NULLS LAST
);
CREATE INDEX "tb_pessoa_tb_beneficio_emergencial1" ON "public"."tb_beneficio_emergencial" USING btree (
  "nome" "pg_catalog"."int4_ops" ASC NULLS LAST
);

-- ----------------------------
-- Primary Key structure for table tb_beneficio_emergencial
-- ----------------------------
ALTER TABLE "public"."tb_beneficio_emergencial" ADD CONSTRAINT "primary_key33" PRIMARY KEY ("cod_benef");

-- ----------------------------
-- Indexes structure for table tb_beneficios_municipais
-- ----------------------------
CREATE INDEX "tb_cad_funcionario_tb_beneficios_municipais" ON "public"."tb_beneficios_municipais" USING btree (
  "cod_func" "pg_catalog"."int4_ops" ASC NULLS LAST
);
CREATE INDEX "tb_pessoa_tb_beneficios_municipais" ON "public"."tb_beneficios_municipais" USING btree (
  "nome" "pg_catalog"."int4_ops" ASC NULLS LAST
);

-- ----------------------------
-- Primary Key structure for table tb_beneficios_municipais
-- ----------------------------
ALTER TABLE "public"."tb_beneficios_municipais" ADD CONSTRAINT "primary_key15" PRIMARY KEY ("cod_benef");

-- ----------------------------
-- Indexes structure for table tb_benf_mun_det
-- ----------------------------
CREATE INDEX "tb_beneficios_municipais_tb_benf_mun_det" ON "public"."tb_benf_mun_det" USING btree (
  "cod_benef" "pg_catalog"."int4_ops" ASC NULLS LAST
);
CREATE INDEX "tb_cad_funcionario_tb_benf_mun_det" ON "public"."tb_benf_mun_det" USING btree (
  "cod_func" "pg_catalog"."int4_ops" ASC NULLS LAST
);

-- ----------------------------
-- Primary Key structure for table tb_benf_mun_det
-- ----------------------------
ALTER TABLE "public"."tb_benf_mun_det" ADD CONSTRAINT "primary_key16" PRIMARY KEY ("cod_bef_mun_detalhe");

-- ----------------------------
-- Primary Key structure for table tb_busca_ativa
-- ----------------------------
ALTER TABLE "public"."tb_busca_ativa" ADD CONSTRAINT "primary_key2" PRIMARY KEY ("cod_ba");

-- ----------------------------
-- Indexes structure for table tb_busca_ativa_det
-- ----------------------------
CREATE INDEX "tb_busca_ativa_tb_busca_ativa_det" ON "public"."tb_busca_ativa_det" USING btree (
  "cod_ba" "pg_catalog"."int4_ops" ASC NULLS LAST
);
CREATE INDEX "tb_cad_funcionario_tb_busca_ativa_det" ON "public"."tb_busca_ativa_det" USING btree (
  "tecnico" "pg_catalog"."int4_ops" ASC NULLS LAST
);

-- ----------------------------
-- Primary Key structure for table tb_busca_ativa_det
-- ----------------------------
ALTER TABLE "public"."tb_busca_ativa_det" ADD CONSTRAINT "primary_key17" PRIMARY KEY ("cod_ba_det");

-- ----------------------------
-- Primary Key structure for table tb_cad_funcionario
-- ----------------------------
ALTER TABLE "public"."tb_cad_funcionario" ADD CONSTRAINT "código" PRIMARY KEY ("cod_func");

-- ----------------------------
-- Indexes structure for table tb_demanda_reprimida
-- ----------------------------
CREATE INDEX "tb_cad_funcionario_tb_demanda_reprimida" ON "public"."tb_demanda_reprimida" USING btree (
  "cod_func" "pg_catalog"."int4_ops" ASC NULLS LAST
);
CREATE INDEX "tb_pessoa_tb_demanda_reprimida" ON "public"."tb_demanda_reprimida" USING btree (
  "nome" "pg_catalog"."int4_ops" ASC NULLS LAST
);

-- ----------------------------
-- Primary Key structure for table tb_demanda_reprimida
-- ----------------------------
ALTER TABLE "public"."tb_demanda_reprimida" ADD CONSTRAINT "primary_key26" PRIMARY KEY ("cod_demanda");

-- ----------------------------
-- Primary Key structure for table tb_diario
-- ----------------------------
ALTER TABLE "public"."tb_diario" ADD CONSTRAINT "primary_key14" PRIMARY KEY ("cod_diario");

-- ----------------------------
-- Indexes structure for table tb_diario_det
-- ----------------------------
CREATE INDEX "tb_pessoa_tb_diario_det" ON "public"."tb_diario_det" USING btree (
  "nome" "pg_catalog"."int4_ops" ASC NULLS LAST
);

-- ----------------------------
-- Primary Key structure for table tb_diario_det
-- ----------------------------
ALTER TABLE "public"."tb_diario_det" ADD CONSTRAINT "primary_key4" PRIMARY KEY ("cod_diario_det");

-- ----------------------------
-- Indexes structure for table tb_encaminhamento
-- ----------------------------
CREATE INDEX "tb_cad_funcionario_tb_encaminhamento" ON "public"."tb_encaminhamento" USING btree (
  "cod_func" "pg_catalog"."int4_ops" ASC NULLS LAST
);
CREATE INDEX "tb_pessoa_tb_encaminhamento" ON "public"."tb_encaminhamento" USING btree (
  "nome" "pg_catalog"."int4_ops" ASC NULLS LAST
);

-- ----------------------------
-- Primary Key structure for table tb_encaminhamento
-- ----------------------------
ALTER TABLE "public"."tb_encaminhamento" ADD CONSTRAINT "primary_key28" PRIMARY KEY ("codenc");

-- ----------------------------
-- Indexes structure for table tb_gest_det
-- ----------------------------
CREATE INDEX "tb_gestante_tb_gest_det" ON "public"."tb_gest_det" USING btree (
  "cod_gestante" "pg_catalog"."int4_ops" ASC NULLS LAST
);

-- ----------------------------
-- Primary Key structure for table tb_gest_det
-- ----------------------------
ALTER TABLE "public"."tb_gest_det" ADD CONSTRAINT "primary_key5" PRIMARY KEY ("código");

-- ----------------------------
-- Indexes structure for table tb_gestante
-- ----------------------------
CREATE INDEX "tb_pessoa_tb_gestante" ON "public"."tb_gestante" USING btree (
  "nome" "pg_catalog"."int4_ops" ASC NULLS LAST
);

-- ----------------------------
-- Primary Key structure for table tb_gestante
-- ----------------------------
ALTER TABLE "public"."tb_gestante" ADD CONSTRAINT "primary_key20" PRIMARY KEY ("cod_gestante");

-- ----------------------------
-- Primary Key structure for table tb_grupo
-- ----------------------------
ALTER TABLE "public"."tb_grupo" ADD CONSTRAINT "primary_key37" PRIMARY KEY ("cod_grupo");

-- ----------------------------
-- Primary Key structure for table tb_grupo_externo
-- ----------------------------
ALTER TABLE "public"."tb_grupo_externo" ADD CONSTRAINT "primary_key22" PRIMARY KEY ("cod_grupo");

-- ----------------------------
-- Primary Key structure for table tb_local_enc
-- ----------------------------
ALTER TABLE "public"."tb_local_enc" ADD CONSTRAINT "primary_key29" PRIMARY KEY ("código");

-- ----------------------------
-- Primary Key structure for table tb_nome_acolhida
-- ----------------------------
ALTER TABLE "public"."tb_nome_acolhida" ADD CONSTRAINT "primary_key1" PRIMARY KEY ("id_nome");

-- ----------------------------
-- Primary Key structure for table tb_of_socio_edu_atualiz
-- ----------------------------
ALTER TABLE "public"."tb_of_socio_edu_atualiz" ADD CONSTRAINT "primary_key24" PRIMARY KEY ("cod_of_se_atualiz");

-- ----------------------------
-- Indexes structure for table tb_of_socio_edu_detalhe
-- ----------------------------
CREATE INDEX "idade2" ON "public"."tb_of_socio_edu_detalhe" USING btree (
  "idade" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST
);
CREATE INDEX "tb_pessoa_tb_of_socio_edu_detalhe" ON "public"."tb_of_socio_edu_detalhe" USING btree (
  "nome" "pg_catalog"."int4_ops" ASC NULLS LAST
);

-- ----------------------------
-- Primary Key structure for table tb_of_socio_edu_detalhe
-- ----------------------------
ALTER TABLE "public"."tb_of_socio_edu_detalhe" ADD CONSTRAINT "primary_key11" PRIMARY KEY ("cod_of_se_det");

-- ----------------------------
-- Primary Key structure for table tb_pbf08
-- ----------------------------
ALTER TABLE "public"."tb_pbf08" ADD CONSTRAINT "codpbf" PRIMARY KEY ("codpbf");

-- ----------------------------
-- Indexes structure for table tb_pessoa
-- ----------------------------
CREATE INDEX "cad_residencia_tb_pessoa" ON "public"."tb_pessoa" USING btree (
  "cod_fam" "pg_catalog"."int4_ops" ASC NULLS LAST
);
CREATE INDEX "cod_resid" ON "public"."tb_pessoa" USING btree (
  "cod_fam" "pg_catalog"."int4_ops" ASC NULLS LAST
);
CREATE INDEX "idade1" ON "public"."tb_pessoa" USING btree (
  "idade" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST
);
CREATE INDEX "tb_pessoa_nome" ON "public"."tb_pessoa" USING btree (
  "nome" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST
);

-- ----------------------------
-- Primary Key structure for table tb_pessoa
-- ----------------------------
ALTER TABLE "public"."tb_pessoa" ADD CONSTRAINT "primary_key8" PRIMARY KEY ("cod_pessoa");

-- ----------------------------
-- Primary Key structure for table tb_recepção
-- ----------------------------
ALTER TABLE "public"."tb_recepção" ADD CONSTRAINT "primary_key27" PRIMARY KEY ("cod_recepcao");

-- ----------------------------
-- Indexes structure for table tb_reg_sint
-- ----------------------------
CREATE INDEX "tb_acomp_tb_reg_sint" ON "public"."tb_reg_sint" USING btree (
  "cod_acomp" "pg_catalog"."int4_ops" ASC NULLS LAST
);
CREATE INDEX "tb_cad_funcionario_tb_reg_sint" ON "public"."tb_reg_sint" USING btree (
  "nome_tecnico" "pg_catalog"."int4_ops" ASC NULLS LAST
);

-- ----------------------------
-- Primary Key structure for table tb_reg_sint
-- ----------------------------
ALTER TABLE "public"."tb_reg_sint" ADD CONSTRAINT "primary_key23" PRIMARY KEY ("cod_reg_sint");

-- ----------------------------
-- Primary Key structure for table tb_registrar_enc
-- ----------------------------
ALTER TABLE "public"."tb_registrar_enc" ADD CONSTRAINT "primary_key38" PRIMARY KEY ("codenc");

-- ----------------------------
-- Primary Key structure for table tb_reuniao
-- ----------------------------
ALTER TABLE "public"."tb_reuniao" ADD CONSTRAINT "primary_key9" PRIMARY KEY ("cod_reuniao");

-- ----------------------------
-- Primary Key structure for table tb_reuniao_det
-- ----------------------------
ALTER TABLE "public"."tb_reuniao_det" ADD CONSTRAINT "primary_key34" PRIMARY KEY ("cod_reuniao_det");

-- ----------------------------
-- Primary Key structure for table tb_scfv_ext_atualiz
-- ----------------------------
ALTER TABLE "public"."tb_scfv_ext_atualiz" ADD CONSTRAINT "primary_key41" PRIMARY KEY ("cod_scfv_ext_atual");

-- ----------------------------
-- Indexes structure for table tb_scfv_ext_detalhe
-- ----------------------------
CREATE INDEX "idade3" ON "public"."tb_scfv_ext_detalhe" USING btree (
  "idade" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST
);
CREATE INDEX "tb_pessoa_tb_scfv_ext_detalhe" ON "public"."tb_scfv_ext_detalhe" USING btree (
  "nome" "pg_catalog"."int4_ops" ASC NULLS LAST
);
CREATE INDEX "tb_pessoa_tb_scfv_ext_detalhe1" ON "public"."tb_scfv_ext_detalhe" USING btree (
  "nome" "pg_catalog"."int4_ops" ASC NULLS LAST
);

-- ----------------------------
-- Primary Key structure for table tb_scfv_ext_detalhe
-- ----------------------------
ALTER TABLE "public"."tb_scfv_ext_detalhe" ADD CONSTRAINT "primary_key18" PRIMARY KEY ("cod_scfve_det");

-- ----------------------------
-- Primary Key structure for table tb_selecao_benef_munic
-- ----------------------------
ALTER TABLE "public"."tb_selecao_benef_munic" ADD CONSTRAINT "primary_key21" PRIMARY KEY ("id_selecao");

-- ----------------------------
-- Indexes structure for table tb_unidade
-- ----------------------------
CREATE UNIQUE INDEX "img_cartao_suas_11_c5_fdba4_e534_a59_a37_baee81_fb24859" ON "public"."tb_unidade" USING btree (
  "img_cartao_suas" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST
);
CREATE UNIQUE INDEX "logo_b734621_a43_dd49_d2_b17_e691_e1340_b136" ON "public"."tb_unidade" USING btree (
  "logo" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST
);
CREATE UNIQUE INDEX "rma1_2_be55_ade007349_dbba89981088449406" ON "public"."tb_unidade" USING btree (
  "rma1" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST
);
CREATE UNIQUE INDEX "rodape_27_fa50_aced984_d689146_ce864235919_f" ON "public"."tb_unidade" USING btree (
  "rodape" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST
);
CREATE INDEX "telefoneunid" ON "public"."tb_unidade" USING btree (
  "telefoneunid" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST
);

-- ----------------------------
-- Primary Key structure for table tb_unidade
-- ----------------------------
ALTER TABLE "public"."tb_unidade" ADD CONSTRAINT "primary_key19" PRIMARY KEY ("cod_unidade");

-- ----------------------------
-- Primary Key structure for table tb_versao
-- ----------------------------
ALTER TABLE "public"."tb_versao" ADD CONSTRAINT "primary_key12" PRIMARY KEY ("código");

-- ----------------------------
-- Primary Key structure for table tb_violacoes
-- ----------------------------
ALTER TABLE "public"."tb_violacoes" ADD CONSTRAINT "primary_key13" PRIMARY KEY ("cod_viol");

-- ----------------------------
-- Foreign Keys structure for table cad_resid_atualizacao
-- ----------------------------
ALTER TABLE "public"."cad_resid_atualizacao" ADD CONSTRAINT "cad_residencia_cad_resid_atualizacao1" FOREIGN KEY ("cod_cad_resd") REFERENCES "public"."cad_residencia" ("cod_fam") ON DELETE NO ACTION ON UPDATE NO ACTION;
ALTER TABLE "public"."cad_resid_atualizacao" ADD CONSTRAINT "tb_cad_funcionario_cad_resid_atualizacao1" FOREIGN KEY ("tecnico_adm") REFERENCES "public"."tb_cad_funcionario" ("cod_func") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- ----------------------------
-- Foreign Keys structure for table tb_aco_retorno
-- ----------------------------
ALTER TABLE "public"."tb_aco_retorno" ADD CONSTRAINT "tb_acomp_tb_aco_retorno1" FOREIGN KEY ("cod_acomp") REFERENCES "public"."tb_acomp" ("cod_acomp") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- ----------------------------
-- Foreign Keys structure for table tb_acomp
-- ----------------------------
ALTER TABLE "public"."tb_acomp" ADD CONSTRAINT "tb_pessoa_tb_acomp1" FOREIGN KEY ("nome") REFERENCES "public"."tb_pessoa" ("cod_pessoa") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- ----------------------------
-- Foreign Keys structure for table tb_at_coletivo_det
-- ----------------------------
ALTER TABLE "public"."tb_at_coletivo_det" ADD CONSTRAINT "tb_at_coletivo_tb_at_coletivo_det1" FOREIGN KEY ("cod_coletivo") REFERENCES "public"."tb_at_coletivo" ("cod_coletivo") ON DELETE NO ACTION ON UPDATE NO ACTION;
ALTER TABLE "public"."tb_at_coletivo_det" ADD CONSTRAINT "tb_pessoa_tb_at_coletivo_det1" FOREIGN KEY ("nome") REFERENCES "public"."tb_pessoa" ("cod_pessoa") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- ----------------------------
-- Foreign Keys structure for table tb_atend
-- ----------------------------
ALTER TABLE "public"."tb_atend" ADD CONSTRAINT "tb_cad_funcionario_tb_atend11" FOREIGN KEY ("cod_func") REFERENCES "public"."tb_cad_funcionario" ("cod_func") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- ----------------------------
-- Foreign Keys structure for table tb_aval_acomp
-- ----------------------------
ALTER TABLE "public"."tb_aval_acomp" ADD CONSTRAINT "tb_acomp_tb_aval_acomp1" FOREIGN KEY ("cod_acomp") REFERENCES "public"."tb_acomp" ("cod_acomp") ON DELETE NO ACTION ON UPDATE NO ACTION;
ALTER TABLE "public"."tb_aval_acomp" ADD CONSTRAINT "tb_cad_funcionario_tb_aval_acomp1" FOREIGN KEY ("tecnico") REFERENCES "public"."tb_cad_funcionario" ("cod_func") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- ----------------------------
-- Foreign Keys structure for table tb_beneficio_emergencial
-- ----------------------------
ALTER TABLE "public"."tb_beneficio_emergencial" ADD CONSTRAINT "tb_cad_funcionario_tb_beneficio_emergencial1" FOREIGN KEY ("cod_tecnico") REFERENCES "public"."tb_cad_funcionario" ("cod_func") ON DELETE NO ACTION ON UPDATE NO ACTION;
ALTER TABLE "public"."tb_beneficio_emergencial" ADD CONSTRAINT "tb_pessoa_tb_beneficio_emergencial11" FOREIGN KEY ("nome") REFERENCES "public"."tb_pessoa" ("cod_pessoa") ON DELETE NO ACTION ON UPDATE NO ACTION;
ALTER TABLE "public"."tb_beneficio_emergencial" ADD CONSTRAINT "tb_pessoa_tb_beneficio_emergencial2" FOREIGN KEY ("nome") REFERENCES "public"."tb_pessoa" ("cod_pessoa") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- ----------------------------
-- Foreign Keys structure for table tb_beneficios_municipais
-- ----------------------------
ALTER TABLE "public"."tb_beneficios_municipais" ADD CONSTRAINT "tb_cad_funcionario_tb_beneficios_municipais1" FOREIGN KEY ("cod_func") REFERENCES "public"."tb_cad_funcionario" ("cod_func") ON DELETE NO ACTION ON UPDATE NO ACTION;
ALTER TABLE "public"."tb_beneficios_municipais" ADD CONSTRAINT "tb_pessoa_tb_beneficios_municipais1" FOREIGN KEY ("nome") REFERENCES "public"."tb_pessoa" ("cod_pessoa") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- ----------------------------
-- Foreign Keys structure for table tb_benf_mun_det
-- ----------------------------
ALTER TABLE "public"."tb_benf_mun_det" ADD CONSTRAINT "tb_beneficios_municipais_tb_benf_mun_det1" FOREIGN KEY ("cod_benef") REFERENCES "public"."tb_beneficios_municipais" ("cod_benef") ON DELETE NO ACTION ON UPDATE NO ACTION;
ALTER TABLE "public"."tb_benf_mun_det" ADD CONSTRAINT "tb_cad_funcionario_tb_benf_mun_det1" FOREIGN KEY ("cod_func") REFERENCES "public"."tb_cad_funcionario" ("cod_func") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- ----------------------------
-- Foreign Keys structure for table tb_busca_ativa_det
-- ----------------------------
ALTER TABLE "public"."tb_busca_ativa_det" ADD CONSTRAINT "tb_busca_ativa_tb_busca_ativa_det1" FOREIGN KEY ("cod_ba") REFERENCES "public"."tb_busca_ativa" ("cod_ba") ON DELETE NO ACTION ON UPDATE NO ACTION;
ALTER TABLE "public"."tb_busca_ativa_det" ADD CONSTRAINT "tb_cad_funcionario_tb_busca_ativa_det1" FOREIGN KEY ("tecnico") REFERENCES "public"."tb_cad_funcionario" ("cod_func") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- ----------------------------
-- Foreign Keys structure for table tb_demanda_reprimida
-- ----------------------------
ALTER TABLE "public"."tb_demanda_reprimida" ADD CONSTRAINT "tb_cad_funcionario_tb_demanda_reprimida1" FOREIGN KEY ("cod_func") REFERENCES "public"."tb_cad_funcionario" ("cod_func") ON DELETE NO ACTION ON UPDATE NO ACTION;
ALTER TABLE "public"."tb_demanda_reprimida" ADD CONSTRAINT "tb_pessoa_tb_demanda_reprimida1" FOREIGN KEY ("nome") REFERENCES "public"."tb_pessoa" ("cod_pessoa") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- ----------------------------
-- Foreign Keys structure for table tb_diario_det
-- ----------------------------
ALTER TABLE "public"."tb_diario_det" ADD CONSTRAINT "tb_pessoa_tb_diario_det1" FOREIGN KEY ("nome") REFERENCES "public"."tb_pessoa" ("cod_pessoa") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- ----------------------------
-- Foreign Keys structure for table tb_encaminhamento
-- ----------------------------
ALTER TABLE "public"."tb_encaminhamento" ADD CONSTRAINT "tb_cad_funcionario_tb_encaminhamento1" FOREIGN KEY ("cod_func") REFERENCES "public"."tb_cad_funcionario" ("cod_func") ON DELETE NO ACTION ON UPDATE NO ACTION;
ALTER TABLE "public"."tb_encaminhamento" ADD CONSTRAINT "tb_pessoa_tb_encaminhamento1" FOREIGN KEY ("nome") REFERENCES "public"."tb_pessoa" ("cod_pessoa") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- ----------------------------
-- Foreign Keys structure for table tb_gest_det
-- ----------------------------
ALTER TABLE "public"."tb_gest_det" ADD CONSTRAINT "tb_gestante_tb_gest_det1" FOREIGN KEY ("cod_gestante") REFERENCES "public"."tb_gestante" ("cod_gestante") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- ----------------------------
-- Foreign Keys structure for table tb_gestante
-- ----------------------------
ALTER TABLE "public"."tb_gestante" ADD CONSTRAINT "tb_pessoa_tb_gestante1" FOREIGN KEY ("nome") REFERENCES "public"."tb_pessoa" ("cod_pessoa") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- ----------------------------
-- Foreign Keys structure for table tb_of_socio_edu_detalhe
-- ----------------------------
ALTER TABLE "public"."tb_of_socio_edu_detalhe" ADD CONSTRAINT "tb_pessoa_tb_of_socio_edu_detalhe1" FOREIGN KEY ("nome") REFERENCES "public"."tb_pessoa" ("cod_pessoa") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- ----------------------------
-- Foreign Keys structure for table tb_pessoa
-- ----------------------------
ALTER TABLE "public"."tb_pessoa" ADD CONSTRAINT "cad_residencia_tb_pessoa1" FOREIGN KEY ("cod_fam") REFERENCES "public"."cad_residencia" ("cod_fam") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- ----------------------------
-- Foreign Keys structure for table tb_reg_sint
-- ----------------------------
ALTER TABLE "public"."tb_reg_sint" ADD CONSTRAINT "tb_acomp_tb_reg_sint1" FOREIGN KEY ("cod_acomp") REFERENCES "public"."tb_acomp" ("cod_acomp") ON DELETE NO ACTION ON UPDATE NO ACTION;
ALTER TABLE "public"."tb_reg_sint" ADD CONSTRAINT "tb_cad_funcionario_tb_reg_sint1" FOREIGN KEY ("nome_tecnico") REFERENCES "public"."tb_cad_funcionario" ("cod_func") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- ----------------------------
-- Foreign Keys structure for table tb_scfv_ext_detalhe
-- ----------------------------
ALTER TABLE "public"."tb_scfv_ext_detalhe" ADD CONSTRAINT "tb_pessoa_tb_scfv_ext_detalhe11" FOREIGN KEY ("nome") REFERENCES "public"."tb_pessoa" ("cod_pessoa") ON DELETE NO ACTION ON UPDATE NO ACTION;
ALTER TABLE "public"."tb_scfv_ext_detalhe" ADD CONSTRAINT "tb_pessoa_tb_scfv_ext_detalhe2" FOREIGN KEY ("nome") REFERENCES "public"."tb_pessoa" ("cod_pessoa") ON DELETE NO ACTION ON UPDATE NO ACTION;
