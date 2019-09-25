--
-- PostgreSQL database dump
--

-- Dumped from database version 11.4
-- Dumped by pg_dump version 11.4

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: sucursales; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.sucursales (
    direccion character varying,
    nombre character varying,
    id integer NOT NULL
);


ALTER TABLE public.sucursales OWNER TO postgres;

--
-- Name: carrito_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.carrito_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.carrito_id_seq OWNER TO postgres;

--
-- Name: carrito_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.carrito_id_seq OWNED BY public.sucursales.id;


--
-- Name: categoria; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.categoria (
    nombre character varying,
    descripcion character varying,
    submenu boolean,
    id integer NOT NULL
);


ALTER TABLE public.categoria OWNER TO postgres;

--
-- Name: categoria_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.categoria_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.categoria_id_seq OWNER TO postgres;

--
-- Name: categoria_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.categoria_id_seq OWNED BY public.categoria.id;


--
-- Name: categoria_insumos; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.categoria_insumos (
    id integer NOT NULL,
    categ_desc character varying
);


ALTER TABLE public.categoria_insumos OWNER TO postgres;

--
-- Name: categoria_insumos_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.categoria_insumos_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.categoria_insumos_id_seq OWNER TO postgres;

--
-- Name: categoria_insumos_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.categoria_insumos_id_seq OWNED BY public.categoria_insumos.id;


--
-- Name: combos; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.combos (
    id_combo integer NOT NULL,
    nombre character varying,
    descripcion character varying,
    precio double precision
);


ALTER TABLE public.combos OWNER TO postgres;

--
-- Name: combos_id_combo_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.combos_id_combo_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.combos_id_combo_seq OWNER TO postgres;

--
-- Name: combos_id_combo_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.combos_id_combo_seq OWNED BY public.combos.id_combo;


--
-- Name: control_movimientos; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.control_movimientos (
    cantidad double precision,
    tipo_mov character varying,
    id_inventario integer,
    ubicacion character varying,
    id_sucursal integer,
    fecha character varying,
    id_usuario integer,
    id_control integer NOT NULL
);


ALTER TABLE public.control_movimientos OWNER TO postgres;

--
-- Name: control_movimientos_id_control_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.control_movimientos_id_control_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.control_movimientos_id_control_seq OWNER TO postgres;

--
-- Name: control_movimientos_id_control_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.control_movimientos_id_control_seq OWNED BY public.control_movimientos.id_control;


--
-- Name: correos; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.correos (
    id integer NOT NULL,
    correo character varying
);


ALTER TABLE public.correos OWNER TO postgres;

--
-- Name: correos_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.correos_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.correos_id_seq OWNER TO postgres;

--
-- Name: correos_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.correos_id_seq OWNED BY public.correos.id;


--
-- Name: detalle_combos; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.detalle_combos (
    id_combo integer,
    id_productos integer,
    cantidad integer
);


ALTER TABLE public.detalle_combos OWNER TO postgres;

--
-- Name: detalle_promociones; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.detalle_promociones (
    id_promocion integer,
    id_productos integer,
    cantidad integer
);


ALTER TABLE public.detalle_promociones OWNER TO postgres;

--
-- Name: detalle_ticket; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.detalle_ticket (
    id_ticket integer,
    id_producto integer,
    cantidad integer,
    servido boolean,
    observaciones character varying,
    id integer NOT NULL,
    tipo_producto integer,
    fecharegistro timestamp without time zone,
    cancelado boolean,
    cortesia integer,
    efectivo_porcentaje double precision
);


ALTER TABLE public.detalle_ticket OWNER TO postgres;

--
-- Name: detalle_ticket_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.detalle_ticket_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.detalle_ticket_id_seq OWNER TO postgres;

--
-- Name: detalle_ticket_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.detalle_ticket_id_seq OWNED BY public.detalle_ticket.id;


--
-- Name: gastos; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.gastos (
    id integer NOT NULL,
    fecha date,
    total double precision,
    id_sucursal integer,
    id_usuario integer,
    fecha_realizacion date,
    nombre character varying
);


ALTER TABLE public.gastos OWNER TO postgres;

--
-- Name: gastos_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.gastos_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.gastos_id_seq OWNER TO postgres;

--
-- Name: gastos_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.gastos_id_seq OWNED BY public.gastos.id;


--
-- Name: historico_corte_especial; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.historico_corte_especial (
    id_ticket integer,
    id_user integer,
    fecha date,
    id_folio integer,
    id_sucursal integer,
    hora character varying,
    id_mesa integer,
    total double precision,
    cancelado boolean,
    tipo_pago character varying,
    nombre character varying,
    serial integer NOT NULL
);


ALTER TABLE public.historico_corte_especial OWNER TO postgres;

--
-- Name: historico_corte_especial_serial_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.historico_corte_especial_serial_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.historico_corte_especial_serial_seq OWNER TO postgres;

--
-- Name: historico_corte_especial_serial_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.historico_corte_especial_serial_seq OWNED BY public.historico_corte_especial.serial;


--
-- Name: historico_detalletickets; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.historico_detalletickets (
    id_ticket integer,
    id_producto integer,
    cantidad integer,
    observaciones character varying,
    cancelado boolean,
    total double precision,
    cortesia integer,
    efectivo_porcentaje double precision
);


ALTER TABLE public.historico_detalletickets OWNER TO postgres;

--
-- Name: historico_promocion_productos; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.historico_promocion_productos (
    id_ticket integer NOT NULL,
    id_promocion integer NOT NULL,
    id_producto integer NOT NULL,
    nombre character varying,
    cantidad integer,
    total double precision
);


ALTER TABLE public.historico_promocion_productos OWNER TO postgres;

--
-- Name: historico_promocion_ticket; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.historico_promocion_ticket (
    id_ticket integer NOT NULL,
    id_promocion integer NOT NULL,
    nombre character varying,
    cantidad integer,
    total double precision
);


ALTER TABLE public.historico_promocion_ticket OWNER TO postgres;

--
-- Name: historico_tickets; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.historico_tickets (
    id_ticket integer,
    id_user integer,
    fecha date,
    id_folio integer,
    id_sucursal integer,
    hora character varying,
    id_mesa integer,
    total double precision,
    cancelado boolean,
    tipo_pago character varying,
    nombre character varying
);


ALTER TABLE public.historico_tickets OWNER TO postgres;

--
-- Name: insumos; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.insumos (
    id_inventario integer,
    cantidad integer,
    id_producto integer,
    id integer NOT NULL
);


ALTER TABLE public.insumos OWNER TO postgres;

--
-- Name: insumos_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.insumos_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.insumos_id_seq OWNER TO postgres;

--
-- Name: insumos_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.insumos_id_seq OWNED BY public.insumos.id;


--
-- Name: inventario; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.inventario (
    cantidad double precision,
    unidad_medida character varying,
    descripcion character varying,
    proveedor character varying,
    marca character varying,
    ubicacion character varying,
    id_sucursal integer,
    id_inventario integer NOT NULL,
    categoria character varying,
    minimo double precision
);


ALTER TABLE public.inventario OWNER TO postgres;

--
-- Name: inventario_id_inventario_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.inventario_id_inventario_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.inventario_id_inventario_seq OWNER TO postgres;

--
-- Name: inventario_id_inventario_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.inventario_id_inventario_seq OWNED BY public.inventario.id_inventario;


--
-- Name: productos; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.productos (
    id_producto integer NOT NULL,
    nombre character varying,
    descripcion character varying,
    precio double precision,
    id_categoria integer,
    id_video character varying,
    nombre_video character varying,
    notificacion integer,
    ruta_imagen character varying,
    subcategoria character varying
);


ALTER TABLE public.productos OWNER TO postgres;

--
-- Name: inventario_porinsumos; Type: VIEW; Schema: public; Owner: postgres
--

CREATE VIEW public.inventario_porinsumos AS
 SELECT ht.fecha,
    ht.id_sucursal,
    sum(hdt.cantidad) AS cantidad_producto,
    iinv.id_inventario,
    iinv.descripcion,
    iis.cantidad AS cantidad_insumo,
    (sum(hdt.cantidad) * iis.cantidad) AS cantidad_vendida
   FROM ((((public.historico_tickets ht
     JOIN public.historico_detalletickets hdt ON ((ht.id_ticket = hdt.id_ticket)))
     JOIN public.productos ppro ON ((hdt.id_producto = ppro.id_producto)))
     JOIN public.insumos iis ON ((iis.id_producto = hdt.id_producto)))
     JOIN public.inventario iinv ON ((iinv.id_inventario = iis.id_inventario)))
  WHERE ((hdt.cancelado = false) AND (ht.cancelado = false))
  GROUP BY ht.fecha, iis.cantidad, iinv.descripcion, iinv.id_inventario, ht.id_sucursal
  ORDER BY iinv.id_inventario;


ALTER TABLE public.inventario_porinsumos OWNER TO postgres;

--
-- Name: key; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.key (
    password character varying,
    id_sucursal integer,
    serial integer NOT NULL
);


ALTER TABLE public.key OWNER TO postgres;

--
-- Name: key_serial_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.key_serial_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.key_serial_seq OWNER TO postgres;

--
-- Name: key_serial_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.key_serial_seq OWNED BY public.key.serial;


--
-- Name: mesas; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.mesas (
    id_mesa integer NOT NULL,
    id_tipo integer,
    id_sucursal integer NOT NULL,
    ocupada boolean,
    mesafusionada integer
);


ALTER TABLE public.mesas OWNER TO postgres;

--
-- Name: productos_id_producto_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.productos_id_producto_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.productos_id_producto_seq OWNER TO postgres;

--
-- Name: productos_id_producto_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.productos_id_producto_seq OWNED BY public.productos.id_producto;


--
-- Name: tickets; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.tickets (
    id_ticket integer NOT NULL,
    id_user integer,
    fecha date,
    id_folio integer,
    id_sucursal integer,
    hora character varying,
    id_mesa integer,
    nombre character varying,
    cortesia integer,
    efectivo_porcentaje double precision
);


ALTER TABLE public.tickets OWNER TO postgres;

--
-- Name: productosview; Type: VIEW; Schema: public; Owner: postgres
--

CREATE VIEW public.productosview AS
 SELECT d.id_ticket,
    t.id_folio,
    d.id_producto,
    d.cantidad,
    (
        CASE
            WHEN (d.cortesia IS NULL) THEN p.precio
            WHEN (d.cortesia = 1) THEN (p.precio - d.efectivo_porcentaje)
            WHEN (d.cortesia = 2) THEN (p.precio - ((p.precio * d.efectivo_porcentaje) / (100)::double precision))
            WHEN (d.cortesia = 3) THEN (0)::double precision
            ELSE NULL::double precision
        END * (d.cantidad)::double precision) AS precio_total,
    p.nombre,
    p.precio AS unitario,
    d.cortesia
   FROM ((public.detalle_ticket d
     JOIN public.productos p ON ((p.id_producto = d.id_producto)))
     JOIN public.tickets t ON ((t.id_ticket = d.id_ticket)))
  WHERE ((d.cancelado = false) AND ((d.cortesia <> 3) OR (d.cortesia IS NULL)));


ALTER TABLE public.productosview OWNER TO postgres;

--
-- Name: promociones; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.promociones (
    id integer NOT NULL,
    nombre character varying,
    descripcion character varying,
    inicia character varying,
    termina character varying,
    precio double precision,
    dias character varying,
    productos character varying,
    productoscodificado character varying
);


ALTER TABLE public.promociones OWNER TO postgres;

--
-- Name: promociones_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.promociones_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.promociones_id_seq OWNER TO postgres;

--
-- Name: promociones_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.promociones_id_seq OWNED BY public.promociones.id;


--
-- Name: roles; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.roles (
    rol character varying NOT NULL,
    descripcion character varying,
    id integer NOT NULL
);


ALTER TABLE public.roles OWNER TO postgres;

--
-- Name: roles_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.roles_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.roles_id_seq OWNER TO postgres;

--
-- Name: roles_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.roles_id_seq OWNED BY public.roles.id;


--
-- Name: subcategoria; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.subcategoria (
    nombre character varying,
    submenu_enlazado integer,
    id integer NOT NULL,
    id_categoria integer,
    id_subcategoria integer
);


ALTER TABLE public.subcategoria OWNER TO postgres;

--
-- Name: subcategoria_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.subcategoria_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.subcategoria_id_seq OWNER TO postgres;

--
-- Name: subcategoria_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.subcategoria_id_seq OWNED BY public.subcategoria.id;


--
-- Name: tickets_id_ticket_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.tickets_id_ticket_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.tickets_id_ticket_seq OWNER TO postgres;

--
-- Name: tickets_id_ticket_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.tickets_id_ticket_seq OWNED BY public.tickets.id_ticket;


--
-- Name: tipo_producto; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.tipo_producto (
    nombre character varying,
    descripcion character varying,
    id_tipoproducto integer NOT NULL
);


ALTER TABLE public.tipo_producto OWNER TO postgres;

--
-- Name: tipo_producto_id_tipoproducto_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.tipo_producto_id_tipoproducto_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.tipo_producto_id_tipoproducto_seq OWNER TO postgres;

--
-- Name: tipo_producto_id_tipoproducto_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.tipo_producto_id_tipoproducto_seq OWNED BY public.tipo_producto.id_tipoproducto;


--
-- Name: users; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.users (
    login character varying NOT NULL,
    nombre character varying,
    id_rol integer,
    password character varying,
    id_sucursal integer,
    menu boolean,
    catalogos boolean,
    bar boolean,
    cocina boolean,
    cuentas boolean,
    transacciones boolean,
    id integer NOT NULL,
    inicio boolean,
    gestion_usuarios boolean,
    sucursales boolean,
    mesas boolean,
    caja boolean,
    productos boolean,
    historial_cuentas boolean,
    reportes boolean,
    autorizar boolean,
    inventario boolean,
    configuraciones boolean,
    iniciar_en integer
);


ALTER TABLE public.users OWNER TO postgres;

--
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.users_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_id_seq OWNER TO postgres;

--
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;


--
-- Name: categoria id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.categoria ALTER COLUMN id SET DEFAULT nextval('public.categoria_id_seq'::regclass);


--
-- Name: categoria_insumos id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.categoria_insumos ALTER COLUMN id SET DEFAULT nextval('public.categoria_insumos_id_seq'::regclass);


--
-- Name: combos id_combo; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.combos ALTER COLUMN id_combo SET DEFAULT nextval('public.combos_id_combo_seq'::regclass);


--
-- Name: control_movimientos id_control; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.control_movimientos ALTER COLUMN id_control SET DEFAULT nextval('public.control_movimientos_id_control_seq'::regclass);


--
-- Name: correos id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.correos ALTER COLUMN id SET DEFAULT nextval('public.correos_id_seq'::regclass);


--
-- Name: detalle_ticket id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.detalle_ticket ALTER COLUMN id SET DEFAULT nextval('public.detalle_ticket_id_seq'::regclass);


--
-- Name: gastos id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.gastos ALTER COLUMN id SET DEFAULT nextval('public.gastos_id_seq'::regclass);


--
-- Name: historico_corte_especial serial; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.historico_corte_especial ALTER COLUMN serial SET DEFAULT nextval('public.historico_corte_especial_serial_seq'::regclass);


--
-- Name: insumos id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.insumos ALTER COLUMN id SET DEFAULT nextval('public.insumos_id_seq'::regclass);


--
-- Name: inventario id_inventario; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.inventario ALTER COLUMN id_inventario SET DEFAULT nextval('public.inventario_id_inventario_seq'::regclass);


--
-- Name: key serial; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.key ALTER COLUMN serial SET DEFAULT nextval('public.key_serial_seq'::regclass);


--
-- Name: productos id_producto; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.productos ALTER COLUMN id_producto SET DEFAULT nextval('public.productos_id_producto_seq'::regclass);


--
-- Name: promociones id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.promociones ALTER COLUMN id SET DEFAULT nextval('public.promociones_id_seq'::regclass);


--
-- Name: roles id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.roles ALTER COLUMN id SET DEFAULT nextval('public.roles_id_seq'::regclass);


--
-- Name: subcategoria id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.subcategoria ALTER COLUMN id SET DEFAULT nextval('public.subcategoria_id_seq'::regclass);


--
-- Name: sucursales id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sucursales ALTER COLUMN id SET DEFAULT nextval('public.carrito_id_seq'::regclass);


--
-- Name: tickets id_ticket; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tickets ALTER COLUMN id_ticket SET DEFAULT nextval('public.tickets_id_ticket_seq'::regclass);


--
-- Name: tipo_producto id_tipoproducto; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tipo_producto ALTER COLUMN id_tipoproducto SET DEFAULT nextval('public.tipo_producto_id_tipoproducto_seq'::regclass);


--
-- Name: users id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);


--
-- Data for Name: categoria; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.categoria (nombre, descripcion, submenu, id) FROM stdin;
ENTRADAS	Entradas	f	82
ESPAGUETTI	Espaguetti	f	83
POLLO	Pollo	f	84
COCTELES	COCTELES 	t	85
FILETES DE PESCADO	Pescaod	f	86
ENSALADAS	ENSALADAS	f	87
CALDOS	CALDOS	f	88
HAMBURGESAS	Ambur	f	89
PESCADOS	PESCADOS	t	90
PULPOS	Pulp	f	91
CAMARONES	Cama	f	92
ESPECIALIDADES	Espe	f	93
POSTRES	Pos	f	94
CERVEZAS	CERVEZAS	t	96
MICHELADAS	Miche	t	98
SUEROS	SUEROS	t	99
COPEO DE VINO	COPEO DE VINO	f	100
BEBIDAS TROPICALES	BEBIDAS TROPICALES 	f	101
CAFES	CAFES	f	102
REFRESCOS	REFRESCOS	f	103
CLAMATOS	CLAMATOS	t	105
AGUAS	Aguas	t	108
\.


--
-- Data for Name: categoria_insumos; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.categoria_insumos (id, categ_desc) FROM stdin;
\.


--
-- Data for Name: combos; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.combos (id_combo, nombre, descripcion, precio) FROM stdin;
16	COMBO AMIGO	ES UN COMBO DE AMIGO	300
15	COMBO1	COBMO DESCRIPCION	324
18	SAMV	DSOF	0
\.


--
-- Data for Name: control_movimientos; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.control_movimientos (cantidad, tipo_mov, id_inventario, ubicacion, id_sucursal, fecha, id_usuario, id_control) FROM stdin;
40	+	2	COCINA	3	2019-07-31 23:38:46.636239+00	1	1
10	+	3	COCINA	3	2019-08-02 21:15:35.156152+00	1	2
35	-	2	COCINA	3	2019-08-02 21:16:46.528803+00	1	3
10	+	2	COCINA	3	2019-08-02 21:27:49.658466+00	1	4
50	+	5	COCINA	3	2019-08-03 18:02:46.916099+00	1	5
3294	#	6	COCINA	3	2019-08-06 12:55:46.574442	0	6
100000	#	7	COCINA	3	2019-08-06 12:57:13.076856	0	7
20000	#	8	COCINA	3	2019-08-06 12:57:56.133049	0	8
1000	+	2	COCINA	3	2019-08-06 16:09:33.129587	1	9
100	+	2	COCINA	3	2019-08-07 18:33:13.541108	1	10
\.


--
-- Data for Name: correos; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.correos (id, correo) FROM stdin;
\.


--
-- Data for Name: detalle_combos; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.detalle_combos (id_combo, id_productos, cantidad) FROM stdin;
16	18	2
16	23	1
15	18	1
15	23	2
23	18	1
23	22	1
23	19	5
\.


--
-- Data for Name: detalle_promociones; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.detalle_promociones (id_promocion, id_productos, cantidad) FROM stdin;
23	1	8
\.


--
-- Data for Name: detalle_ticket; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.detalle_ticket (id_ticket, id_producto, cantidad, servido, observaciones, id, tipo_producto, fecharegistro, cancelado, cortesia, efectivo_porcentaje) FROM stdin;
440	334	1	t		767	0	2019-08-27 15:31:27.129239	f	\N	\N
440	406	1	t	Sin fruta	768	0	2019-08-27 15:31:27.129239	f	\N	\N
440	136	2	t	Las 2 con solo ezpaguetti rojo	769	0	2019-08-27 15:31:27.129239	f	\N	\N
441	270	1	t		770	0	2019-08-27 15:45:43.417983	f	\N	\N
441	411	1	t		771	0	2019-08-27 15:47:43.359819	f	\N	\N
441	121	1	t		772	0	2019-08-27 15:54:00.985931	f	\N	\N
441	111	1	t		773	0	2019-08-27 15:54:00.985931	f	\N	\N
441	175	1	t		774	0	2019-08-27 15:54:00.985931	f	\N	\N
441	226	1	t		775	0	2019-08-27 15:54:00.985931	f	\N	\N
442	187	1	t		776	0	2019-08-27 16:07:49.770266	f	\N	\N
442	132	1	t		777	0	2019-08-27 16:07:49.770266	f	\N	\N
442	185	1	t		778	0	2019-08-27 16:07:49.770266	f	\N	\N
442	111	1	t		779	0	2019-08-27 16:07:49.770266	f	\N	\N
442	163	1	t	Con pulpo 	780	0	2019-08-27 16:07:49.770266	f	\N	\N
442	121	3	t	Separados	781	0	2019-08-27 16:07:49.770266	f	\N	\N
442	180	1	t		782	0	2019-08-27 16:07:49.770266	f	\N	\N
442	270	2	t		783	0	2019-08-27 16:07:49.770266	f	\N	\N
442	430	1	t		784	0	2019-08-27 16:07:49.770266	f	\N	\N
443	430	1	t		785	0	2019-08-27 16:16:23.809568	f	\N	\N
443	341	1	t		786	0	2019-08-27 16:16:23.809568	f	\N	\N
443	270	1	t		787	0	2019-08-27 16:16:23.809568	f	\N	\N
444	430	1	t		788	0	2019-08-27 16:20:44.446556	f	\N	\N
\.


--
-- Data for Name: gastos; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.gastos (id, fecha, total, id_sucursal, id_usuario, fecha_realizacion, nombre) FROM stdin;
1	2019-05-10	580	3	1	2019-06-15	Corona
2	2019-05-10	500	3	1	2019-06-15	Comida trabajadores
3	2019-06-15	300	3	1	2019-06-15	Coca Cola
4	2019-06-15	800	3	1	2019-06-15	Carne 
5	2019-06-15	200	3	1	2019-06-15	Corona
6	2019-06-15	300	3	1	2019-06-15	Coca Cola
7	2019-06-15	800	3	1	2019-06-15	Carne 
8	2019-06-15	200	3	1	2019-06-15	Corona
9	2019-06-18	500	3	1	2019-06-18	Cerveza
10	2019-06-18	50	3	1	2019-06-18	Pago carne
11	2019-07-01	20	3	1	2019-07-03	Cereveza
\.


--
-- Data for Name: historico_corte_especial; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.historico_corte_especial (id_ticket, id_user, fecha, id_folio, id_sucursal, hora, id_mesa, total, cancelado, tipo_pago, nombre, serial) FROM stdin;
\.


--
-- Data for Name: historico_detalletickets; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.historico_detalletickets (id_ticket, id_producto, cantidad, observaciones, cancelado, total, cortesia, efectivo_porcentaje) FROM stdin;
162	18	3		f	129	\N	\N
163	22	2		f	30	\N	\N
163	18	4		f	172	\N	\N
164	23	3		f	150	\N	\N
164	18	1		f	43	\N	\N
165	20	2		f	40	\N	\N
165	18	2		f	86	\N	\N
166	18	3		f	129	\N	\N
168	18	1		f	43	\N	\N
170	21	3		f	30	\N	\N
174	18	1		f	43	\N	\N
176	18	1		f	43	\N	\N
179	18	1		f	43	\N	\N
186	37	2		f	92	\N	\N
186	35	2		f	60	\N	\N
187	32	1		f	50	\N	\N
190	37	1		t	0	\N	\N
190	35	3		f	90	\N	\N
189	33	1		f	65	\N	\N
189	40	1		t	0	\N	\N
191	36	1		f	85	\N	\N
192	34	1		f	55	\N	\N
194	37	3		t	0	\N	\N
194	34	3		f	165	\N	\N
194	35	1		f	30	\N	\N
194	40	1		f	25	\N	\N
204	33	2		f	130	\N	\N
204	35	2		f	60	\N	\N
205	37	1		f	46	\N	\N
205	34	1		f	55	\N	\N
205	35	2		f	60	\N	\N
206	32	2	Sin cebolla	f	100	\N	\N
207	37	2		t	0	\N	\N
207	34	2		f	110	\N	\N
207	35	3		f	90	\N	\N
209	37	1		f	46	\N	\N
211	37	1		f	46	\N	\N
211	35	2		f	60	\N	\N
211	38	1		f	15	\N	\N
212	37	1		f	46	\N	\N
212	35	3		f	90	\N	\N
213	37	1		f	46	\N	\N
213	33	1		f	65	\N	\N
213	35	1		f	30	\N	\N
213	35	2		f	60	\N	\N
213	36	5		f	425	\N	\N
214	34	1		f	55	\N	\N
214	35	4		f	120	\N	\N
214	36	4		f	340	\N	\N
214	32	3		f	150	\N	\N
215	35	1		f	30	\N	\N
215	35	5		f	150	\N	\N
219	38	2		f	30	\N	\N
219	32	5		f	250	\N	\N
220	37	3		f	138	\N	\N
220	33	1		f	65	\N	\N
220	34	1		f	55	\N	\N
220	35	3		f	90	\N	\N
220	38	3		f	45	\N	\N
220	40	1		f	25	\N	\N
221	37	1		f	46	\N	\N
221	34	3		f	165	\N	\N
221	35	1		f	30	\N	\N
221	36	1		f	85	\N	\N
221	40	4		f	100	\N	\N
221	32	10		f	500	\N	\N
222	41	4		f	200	\N	\N
223	38	3		f	45	\N	\N
223	32	3		f	150	\N	\N
224	33	2		f	130	\N	\N
224	33	2		f	130	\N	\N
224	34	2		f	110	\N	\N
224	34	1		f	55	\N	\N
224	38	3		f	45	\N	\N
225	37	3		f	138	\N	\N
225	40	3		f	75	\N	\N
226	37	2		f	92	\N	\N
226	33	3		f	195	\N	\N
226	34	3		f	165	\N	\N
226	35	2		f	60	\N	\N
226	38	3		f	45	\N	\N
226	40	3		f	75	\N	\N
226	32	2		f	100	\N	\N
227	33	1		f	65	\N	\N
227	34	1		f	55	\N	\N
227	38	2		f	30	\N	\N
227	40	1		f	25	\N	\N
227	32	2		f	100	\N	\N
228	37	1		f	46	\N	\N
228	33	1		f	65	\N	\N
228	38	2		f	30	\N	\N
228	32	1		f	50	\N	\N
229	37	5		f	230	\N	\N
229	35	5		f	150	\N	\N
229	32	3		f	150	\N	\N
230	37	2		f	92	\N	\N
230	33	2		f	130	\N	\N
230	34	1		f	55	\N	\N
230	35	2		f	60	\N	\N
231	37	2		f	92	\N	\N
231	33	2		f	130	\N	\N
231	34	2		f	110	\N	\N
231	35	3		f	90	\N	\N
231	32	1		f	50	\N	\N
232	38	3		f	45	\N	\N
232	32	3		f	150	\N	\N
233	37	2		f	92	\N	\N
233	33	1		f	65	\N	\N
233	34	1		f	55	\N	\N
233	35	2		f	60	\N	\N
233	38	2		f	30	\N	\N
233	32	2		f	100	\N	\N
234	37	1		f	46	\N	\N
234	33	1		f	65	\N	\N
234	34	1		f	55	\N	\N
234	35	1		f	30	\N	\N
234	36	1		f	85	\N	\N
234	38	1		f	15	\N	\N
234	40	1		f	25	\N	\N
234	41	1		f	50	\N	\N
234	32	1		f	50	\N	\N
235	37	5		f	230	\N	\N
235	33	5		f	325	\N	\N
235	32	5		f	250	\N	\N
236	37	6		f	276	\N	\N
236	35	6		f	180	\N	\N
236	36	6		f	510	\N	\N
236	32	1		f	50	\N	\N
237	37	10		f	460	\N	\N
238	33	10		f	650	\N	\N
239	37	4		f	184	\N	\N
239	35	3		f	90	\N	\N
239	36	5		f	425	\N	\N
240	37	2		f	92	\N	\N
240	35	2		f	60	\N	\N
241	32	7		f	350	\N	\N
242	38	8		f	120	\N	\N
243	33	1		f	65	\N	\N
243	34	1		f	55	\N	\N
243	40	6		f	150	\N	\N
243	40	1		f	25	\N	\N
244	33	5		f	325	\N	\N
245	34	4		f	220	\N	\N
245	40	7		f	175	\N	\N
246	32	2		f	100	\N	\N
247	32	1		f	50	\N	\N
248	32	2		f	100	\N	\N
249	32	3		f	150	\N	\N
250	32	4		f	200	\N	\N
251	32	5		f	250	\N	\N
252	38	2		f	30	\N	\N
252	32	2		f	100	\N	\N
256	54	2		f	130	\N	\N
258	72	2		f	60	\N	\N
258	72	2	Mango	f	60	\N	\N
260	45	1		f	75	\N	\N
260	46	5		f	450	\N	\N
260	63	1		f	165	\N	\N
260	64	2		f	330	\N	\N
260	74	1		f	35	\N	\N
261	44	1		f	80	\N	\N
261	45	3		f	225	\N	\N
261	60	1		f	160	\N	\N
261	62	1		f	290	\N	\N
261	69	1		f	35	\N	\N
261	64	1		f	165	\N	\N
261	67	1		f	25	\N	\N
263	44	2		f	160	\N	\N
263	45	2		f	150	\N	\N
263	48	1		f	75	\N	\N
263	62	1	Sin cebolla	f	290	\N	\N
263	69	2		f	70	\N	\N
263	73	2	Sin hielos	f	70	\N	\N
265	47	1		f	85	\N	\N
266	59	1	Sin cebolla	f	175	\N	\N
266	73	1		f	35	\N	\N
267	45	1		f	75	\N	\N
267	76	1		f	30	\N	\N
264	44	3		f	240	\N	\N
264	61	3		f	870	\N	\N
269	45	1		f	75	\N	\N
269	73	1		f	35	\N	\N
271	44	1		f	80	\N	\N
274	49	2		f	170	\N	\N
275	44	2		f	160	\N	\N
275	45	1		f	75	\N	\N
275	49	2		f	170	\N	\N
275	57	2		f	180	\N	\N
275	58	1		f	95	\N	\N
276	49	2		f	170	\N	\N
276	53	1		f	32	\N	\N
276	56	1		f	125	\N	\N
276	57	4		f	360	\N	\N
277	44	1	null	f	80	\N	\N
277	45	1	mariscal	f	75	\N	\N
277	45	1	null	f	75	\N	\N
277	74	1	sin huelos	f	35	\N	\N
277	74	2		f	70	\N	\N
278	49	2		f	170	\N	\N
278	52	2		f	150	\N	\N
278	64	3		f	495	\N	\N
279	44	2		f	160	\N	\N
279	45	1		f	75	\N	\N
279	54	1		f	65	\N	\N
281	45	1		f	75	\N	\N
281	46	1		f	90	\N	\N
281	70	1		f	35	\N	\N
281	73	1		f	35	\N	\N
281	74	1	Sin hielo	f	35	\N	\N
280	44	1		f	80	\N	\N
280	48	1	Sin chile	f	75	\N	\N
280	49	3		f	255	\N	\N
280	74	2		f	70	\N	\N
282	44	3		f	240	\N	\N
282	48	1		f	75	\N	\N
282	49	1		f	85	\N	\N
282	54	1		f	65	\N	\N
282	55	1		f	65	\N	\N
282	55	1		f	65	\N	\N
282	55	1		f	65	\N	\N
282	56	3		f	375	\N	\N
282	57	4		f	360	\N	\N
282	58	1		f	95	\N	\N
282	74	3		f	105	\N	\N
284	55	2		f	130	\N	\N
284	74	2		f	70	\N	\N
293	44	2		f	160	\N	\N
293	69	2		f	70	\N	\N
301	44	1		f	80	\N	\N
302	55	1		f	65	\N	\N
297	55	1	Sin salsita ni otras saldas picantes	f	65	\N	\N
297	55	1		f	65	\N	\N
297	56	1		f	125	\N	\N
297	57	3		f	270	\N	\N
297	66	2		f	420	\N	\N
298	44	2		f	160	\N	\N
298	55	1		f	65	\N	\N
298	67	2		f	50	\N	\N
298	73	1		f	35	\N	\N
299	54	2		f	130	\N	\N
299	56	1	Sin cebolla	f	125	\N	\N
300	49	2		f	170	\N	\N
303	45	1		f	75	\N	\N
303	74	3		f	105	\N	\N
306	44	1	Sin cebilla	f	80	\N	\N
306	45	3		f	225	\N	\N
306	45	2		f	150	\N	\N
306	45	2		f	150	\N	\N
306	48	1		f	75	\N	\N
306	48	1		f	75	\N	\N
306	49	1	sin cebolla	f	85	\N	\N
306	49	1	sin cebolla	f	85	\N	\N
309	44	1		f	80	\N	\N
309	44	1		f	80	\N	\N
309	44	1		f	80	\N	\N
309	45	2		f	150	\N	\N
309	45	2		f	150	\N	\N
309	45	2		f	150	\N	\N
309	48	1	Sin crena	f	75	\N	\N
309	48	1	Sin crema	f	75	\N	\N
309	49	1		f	85	\N	\N
309	49	2		f	170	\N	\N
309	50	1		f	65	\N	\N
309	54	1		f	65	\N	\N
309	73	1	Sin hielos	f	35	\N	\N
309	74	3		f	105	\N	\N
309	74	3		f	105	\N	\N
309	74	3		f	105	\N	\N
309	74	3		f	105	\N	\N
309	76	2		f	60	\N	\N
309	78	2	Sin hielos	f	70	\N	\N
309	79	1		f	50	\N	\N
310	59	2	Sin cebolla y Chile 	f	350	\N	\N
310	69	4		f	140	\N	\N
310	69	2		f	70	\N	\N
310	67	1		f	25	\N	\N
310	73	5		f	175	\N	\N
310	74	1		f	35	\N	\N
310	74	4	Esta es una prueba sobre el ancho de la fila	f	140	\N	\N
310	75	4		f	120	\N	\N
310	76	3		f	90	\N	\N
310	76	7	Sin hielo y sin limones	f	210	\N	\N
310	77	2		f	50	\N	\N
312	49	3		f	255	\N	\N
312	56	2		f	250	\N	\N
312	76	2		f	60	\N	\N
311	44	2		f	160	\N	\N
311	45	2		f	150	\N	\N
311	46	2		f	180	\N	\N
314	56	1	Dfd	f	125	\N	\N
314	57	1	Sin sal	f	90	\N	\N
315	55	1		f	65	\N	\N
315	55	1		f	65	\N	\N
315	57	3		f	270	\N	\N
315	73	1		f	35	\N	\N
315	74	1		f	35	\N	\N
315	76	1		f	30	\N	\N
318	59	1		f	175	\N	\N
318	59	1	Sin cebolla	f	175	\N	\N
318	44	1		f	80	\N	\N
318	60	1		f	160	\N	\N
318	61	4		f	1160	\N	\N
318	62	1	Sin carme	f	290	\N	\N
318	64	1		f	165	\N	\N
318	64	1		f	165	\N	\N
318	73	1	Sin jielos	f	35	\N	\N
318	73	1	Sin hielos	f	35	\N	\N
318	73	1		f	35	\N	\N
318	74	1		f	35	\N	\N
318	74	2		f	70	\N	\N
318	74	2		f	70	\N	\N
318	74	3		f	105	\N	\N
318	74	2		f	70	\N	\N
318	77	1	Al tiempo	f	25	\N	\N
319	44	1		f	80	\N	\N
319	45	1	sin hielos	f	75	\N	\N
319	54	1		f	65	\N	\N
319	55	1	sin qusito	f	65	\N	\N
319	56	1		f	125	\N	\N
319	57	1		f	90	\N	\N
319	58	1		f	95	\N	\N
319	73	1		f	35	\N	\N
319	74	2		f	70	\N	\N
319	78	2		f	70	\N	\N
320	69	2		f	70	\N	\N
320	70	2		f	70	\N	\N
322	59	2		f	350	\N	\N
322	44	1		f	80	\N	\N
322	62	2		f	580	\N	\N
322	67	2	Sin azucar	f	50	\N	\N
321	45	1		f	75	\N	\N
321	61	1	Termino 3/4	f	290	\N	\N
321	75	1	Mineral	f	30	\N	\N
324	44	1		f	80	\N	\N
324	45	3		f	225	\N	\N
324	46	1		f	90	\N	\N
325	44	1		f	80	\N	\N
325	45	1		f	75	\N	\N
325	60	1		f	160	\N	\N
325	48	1		f	75	\N	\N
325	61	2		f	580	\N	\N
325	61	0		f	0	\N	\N
329	124	1		f	700	\N	\N
330	72	1		f	80	\N	\N
330	73	1		f	60	\N	\N
331	223	2		f	70	\N	\N
332	146	6		f	420	\N	\N
333	146	2		f	140	\N	\N
333	146	1		f	70	\N	\N
333	223	3		f	105	\N	\N
333	223	1		f	35	\N	\N
333	223	1		f	35	\N	\N
334	48	1		f	60	\N	\N
335	50	1		f	75	\N	\N
337	223	5		f	175	\N	\N
337	223	1		f	35	\N	\N
337	223	2		f	70	\N	\N
337	223	2		f	70	\N	\N
337	223	2		f	70	\N	\N
338	50	3		f	225	\N	\N
338	85	2		f	120	\N	\N
339	44	1		f	35	\N	\N
339	150	2		f	200	\N	\N
340	48	1		f	60	\N	\N
373	45	1		f	35	\N	\N
373	150	1		f	100	\N	\N
375	65	2		f	140	\N	\N
375	74	1		f	60	\N	\N
375	148	1		f	110	\N	\N
376	87	1		f	0	\N	\N
376	130	1		f	1000	\N	\N
396	48	1		f	60	\N	\N
392	48	1		f	60	\N	\N
398	48	1		f	60	\N	\N
402	44	2		f	70	\N	\N
402	45	2		f	70	\N	\N
402	50	1		f	75	\N	\N
402	51	1		f	70	\N	\N
402	53	1		f	120	\N	\N
402	56	1		f	8	\N	\N
402	73	3		f	180	\N	\N
402	124	1		f	700	\N	\N
402	148	1		f	110	\N	\N
402	148	2		f	220	\N	\N
402	201	1		f	700	\N	\N
403	51	1		f	70	\N	\N
409	94	1		f	152	\N	\N
409	94	1		f	152	\N	\N
409	96	1		t	0	\N	\N
409	101	1		f	555	\N	\N
409	101	1		f	555	\N	\N
409	101	1		f	555	\N	\N
409	101	1		f	555	\N	\N
409	104	1		t	0	\N	\N
409	105	1		f	45896	\N	\N
409	105	1		f	45896	\N	\N
409	105	1		f	45896	\N	\N
409	108	1		t	0	\N	\N
411	104	1		f	452	\N	\N
411	105	1		f	45896	\N	\N
410	94	1		f	152	\N	\N
410	94	1		f	0	3	\N
410	101	1		f	15	1	540
410	105	1		f	45896	\N	\N
410	105	2		f	1835.83999999999651	2	98
410	105	1		f	2294.80000000000291	2	95
410	106	1		f	324	\N	\N
410	106	1		t	0	\N	\N
412	94	1		f	0	3	\N
412	94	1		f	0	3	\N
412	100	1		f	90	\N	\N
412	100	1		f	90	\N	\N
412	101	1		f	555	\N	\N
412	101	1		f	555	\N	\N
414	112	1		f	19	\N	\N
414	128	1		f	95	\N	\N
414	134	1		f	70	\N	\N
414	163	1		f	110	\N	\N
414	186	1		f	95	\N	\N
414	188	1		f	95	\N	\N
413	101	1		f	555	\N	\N
413	133	1		f	70	\N	\N
413	181	1		f	99	\N	\N
413	289	1		f	40	\N	\N
416	111	3		f	57	\N	\N
416	182	2		f	198	\N	\N
416	206	3		f	495	\N	\N
416	268	3		f	105	\N	\N
416	321	3		f	120	\N	\N
416	333	2		f	44	\N	\N
416	385	2		f	96	\N	\N
417	123	3		f	165	\N	\N
417	128	1		f	95	\N	\N
417	155	3		f	300	\N	\N
417	176	2		f	220	\N	\N
417	184	3		f	420	\N	\N
417	186	3		f	285	\N	\N
417	209	3		f	360	\N	\N
417	210	3		f	495	\N	\N
417	234	2		f	340	\N	\N
417	239	4		f	120	\N	\N
417	277	2		f	72	\N	\N
417	282	3		f	105	\N	\N
417	315	2		f	120	\N	\N
417	338	2		f	44	\N	\N
417	339	3		f	66	\N	\N
417	351	2		f	88	\N	\N
417	364	3		f	135	\N	\N
417	375	3		f	195	\N	\N
420	111	1		f	19	\N	\N
420	123	1		f	55	\N	\N
420	159	1		f	100	\N	\N
420	163	1		f	110	\N	\N
423	134	1		f	70	\N	\N
423	137	1		f	58	\N	\N
423	133	1		f	70	\N	\N
423	156	1		f	0	3	\N
423	163	2	Sin cebolla	f	220	\N	\N
423	181	2		f	198	\N	\N
423	254	1		f	29	\N	\N
423	319	1		f	36	\N	\N
423	407	1		f	32	\N	\N
422	312	1		f	60	\N	\N
421	127	2		f	138	\N	\N
421	156	2		f	178	\N	\N
421	186	2		f	190	\N	\N
421	227	2		f	270	\N	\N
425	134	1		f	70	\N	\N
425	321	1		f	40	\N	\N
428	123	1		f	55	\N	\N
428	111	3		f	57	\N	\N
430	159	1		f	100	\N	\N
431	341	1		f	39	\N	\N
434	122	1		f	55	\N	\N
434	122	1		f	55	\N	\N
434	123	1		f	55	\N	\N
434	152	1		f	100	\N	\N
434	186	1		f	95	\N	\N
434	195	1		f	165	\N	\N
434	195	1		f	165	\N	\N
434	195	1		f	165	\N	\N
434	210	1		f	165	\N	\N
434	269	1		f	33	\N	\N
434	312	1		f	60	\N	\N
434	321	1		f	40	\N	\N
434	326	2		f	60	\N	\N
434	333	1		f	22	\N	\N
434	333	1		f	22	\N	\N
435	122	1		f	55	\N	\N
435	152	1		f	100	\N	\N
435	195	1		f	165	\N	\N
435	207	1		f	120	\N	\N
435	243	1		f	30	\N	\N
435	321	1		f	40	\N	\N
435	326	2		f	60	\N	\N
435	334	1		f	22	\N	\N
435	351	1		f	44	\N	\N
436	150	1		f	89	\N	\N
436	159	1		f	100	\N	\N
436	112	2		f	38	\N	\N
438	135	1		f	58	\N	\N
438	137	1	Con pulpo	f	58	\N	\N
438	141	1	Con pulpo ceviche y ostion sin cebolla con poco tomate 	f	58	\N	\N
438	111	1		f	19	\N	\N
439	111	1		f	19	\N	\N
\.


--
-- Data for Name: historico_promocion_productos; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.historico_promocion_productos (id_ticket, id_promocion, id_producto, nombre, cantidad, total) FROM stdin;
\.


--
-- Data for Name: historico_promocion_ticket; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.historico_promocion_ticket (id_ticket, id_promocion, nombre, cantidad, total) FROM stdin;
\.


--
-- Data for Name: historico_tickets; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.historico_tickets (id_ticket, id_user, fecha, id_folio, id_sucursal, hora, id_mesa, total, cancelado, tipo_pago, nombre) FROM stdin;
162	1	2019-05-10	1	3	\N	1	129	f	T	\N
163	1	2019-05-10	1	3	\N	30	202	f	C	\N
164	1	2019-05-10	1	3	\N	1	193	f	T	\N
165	1	2019-05-10	1	3	\N	3	126	f	E	\N
166	1	2019-05-13	1	3	\N	1	129	f	T	\N
167	1	2019-05-15	1	3	\N	1	0	t	\N	\N
168	1	2019-05-15	1	2	\N	50	43	f	E	\N
169	1	2019-05-16	1	3	\N	1	0	t	\N	\N
170	1	2019-05-16	1	3	\N	30	30	f	T	\N
171	1	2019-05-16	1	3	\N	1	0	t	\N	\N
172	1	2019-05-20	1	2	\N	1	0	t	\N	\N
174	1	2019-05-20	1	2	\N	2	43	f	C	\N
173	1	2019-05-20	1	3	\N	1	0	t	\N	\N
175	1	2019-05-20	1	3	\N	1	0	t	\N	\N
176	1	2019-05-20	1	3	\N	1	43	f	T	\N
177	1	2019-05-20	2	3	\N	30	0	t	\N	\N
178	1	2019-05-20	1	3	\N	3	0	t	\N	\N
179	2	2019-05-20	1	3	\N	3	43	f	T	\N
180	1	2019-05-20	1	3	\N	3	0	t	\N	\N
181	2	2019-05-20	2	3	\N	30	0	t	\N	\N
182	1	2019-05-20	3	3	\N	1	0	t	\N	\N
184	4	2019-05-20	1	2	\N	2	0	t	\N	\N
183	1	2019-05-20	1	3	\N	3	0	t	\N	\N
185	2	2019-05-20	1	3	\N	3	0	f	T	\N
186	1	2019-05-20	2	3	\N	30	152	f	E	\N
187	1	2019-05-21	1	3	\N	1	50	f	C	\N
190	1	2019-05-21	3	3	\N	30	90	f	E	\N
189	1	2019-05-21	2	3	\N	3	65	f	E	\N
191	1	2019-05-21	3	3	\N	30	0	t	\N	\N
188	1	2019-05-21	1	3	\N	1	0	t	\N	\N
192	1	2019-05-22	2	3	\N	30	55	f	E	\N
195	1	2019-05-25	2	3	\N	30	0	t	\N	\N
194	1	2019-05-25	1	3	\N	3	220	f	E	\N
196	1	2019-05-25	1	3	\N	1	0	t	\N	\N
197	1	2019-05-25	1	3	\N	3	0	t	\N	\N
198	1	2019-05-25	1	3	\N	1	0	t	\N	\N
201	1	2019-05-25	3	3	\N	1	0	t	\N	\N
200	1	2019-05-25	2	3	\N	3	0	t	\N	\N
199	1	2019-05-25	1	3	\N	30	0	t	\N	\N
193	1	2019-05-24	1	2	\N	1	0	t	\N	\N
203	1	2019-05-25	1	3	\N	1	0	t	\N	\N
204	1	2019-05-25	1	3	\N	30	190	f	E	\N
205	1	2019-05-25	1	3	\N	30	161	f	E	\N
206	1	2019-05-25	1	3	\N	3	0	t	\N	\N
207	1	2019-05-25	2	3	\N	30	200	f	E	\N
208	1	2019-05-25	1	3	\N	1	0	t	\N	\N
209	1	2019-05-25	2	3	\N	3	0	t	\N	\N
210	1	2019-06-04	1	3	\N	1	0	t	\N	\N
211	1	2019-06-04	1	3	\N	1	121	f	E	\N
212	1	2019-06-05	1	3	\N	1	136	f	E	\N
213	1	2019-06-06	1	3	\N	1	626	f	E	\N
214	1	2019-06-06	1	3	\N	3	0	t	\N	\N
215	1	2019-06-06	2	3	\N	30	0	t	\N	\N
217	7	2019-06-06	4	3	\N	1	0	f	E	\N
216	7	2019-06-06	3	3	\N	3	0	f	E	\N
219	1	2019-06-11	5	3	\N	30	280	f	E	\N
220	1	2019-06-11	1	3	\N	1	418	f	E	\N
221	1	2019-06-11	1	3	\N	3	926	f	T	\N
222	1	2019-06-11	1	3	\N	30	0	t	\N	\N
223	1	2019-06-11	1	3	\N	3	195	f	E	\N
224	1	2019-06-11	1	3	\N	1	470	f	T	\N
225	1	2019-06-11	2	3	\N	3	213	f	E	\N
226	1	2019-06-11	1	3	\N	1	732	f	E	\N
227	1	2019-06-12	1	3	\N	1	275	f	T	\N
228	1	2019-06-12	2	3	\N	3	191	f	E	\N
229	1	2019-06-12	3	3	\N	30	530	f	E	\N
230	1	2019-06-12	1	3	\N	1	0	t	\N	\N
231	1	2019-06-14	1	3	\N	1	472	f	E	\N
232	1	2019-06-14	2	3	\N	3	195	f	E	\N
233	1	2019-06-15	1	3	\N	1	402	f	E	\N
234	1	2019-06-15	1	3	\N	1	421	f	T	\N
235	1	2019-06-15	2	3	\N	2	805	f	T	\N
236	1	2019-06-15	3	3	\N	3	1016	f	C	\N
237	1	2019-06-15	4	3	\N	4	460	f	E	\N
238	1	2019-06-15	5	3	\N	5	650	f	O	\N
239	1	2019-06-15	1	3	\N	4	0	t	\N	\N
240	1	2019-06-15	1	3	\N	2	0	t	\N	\N
241	1	2019-06-15	1	3	\N	5	350	f	E	\N
242	1	2019-06-15	1	3	\N	1	120	f	E	\N
243	1	2019-06-15	1	3	\N	2	295	f	E	\N
244	1	2019-06-15	1	3	\N	2	325	f	T	\N
245	1	2019-06-15	2	3	\N	5	395	f	T	\N
246	1	2019-06-15	1	3	\N	1	100	f	E	\N
247	1	2019-06-15	1	3	\N	1	50	f	E	\N
248	1	2019-06-15	2	3	\N	2	100	f	T	\N
249	1	2019-06-15	3	3	\N	3	150	f	E	\N
250	1	2019-06-15	4	3	\N	4	200	f	E	\N
251	1	2019-06-15	5	3	\N	5	250	f	T	\N
252	1	2019-06-16	1	3	\N	1	0	t	\N	\N
253	1	2019-06-17	1	3	\N	1	0	t	\N	\N
254	1	2019-06-17	1	3	\N	3	0	t	\N	\N
255	1	2019-06-17	1	3	\N	2	0	t	\N	\N
256	1	2019-06-17	1	3	\N	2	0	t	\N	\N
258	1	2019-06-17	2	3	\N	5	120	f	E	\N
259	1	2019-06-17	2	3	\N	1	0	t	\N	\N
257	1	2019-06-17	1	3	\N	2	0	t	\N	\N
260	1	2019-06-17	1	3	\N	5	0	t	\N	\N
261	1	2019-06-17	2	3	\N	4	0	t	\N	\N
262	1	2019-06-17	3	3	\N	1	0	t	\N	\N
263	2	2019-06-17	1	3	\N	1	815	f	T	\N
265	2	2019-06-17	3	3	\N	1	0	t	\N	\N
266	2	2019-06-17	3	3	\N	1	210	f	E	\N
267	1	2019-06-17	4	3	\N	2	105	f	E	\N
264	1	2019-06-17	2	3	\N	3	1110	f	T	\N
268	1	2019-06-17	1	3	\N	2	0	t	\N	\N
269	1	2019-06-17	1	3	\N	1	110	f	E	\N
270	1	2019-06-18	1	3	\N	5	0	t	\N	\N
271	1	2019-06-18	1	3	\N	1	0	t	\N	\N
272	1	2019-06-18	1	3	\N	1	0	t	\N	\N
273	1	2019-06-18	1	3	\N	1	0	t	\N	\N
274	1	2019-06-18	1	3	\N	1	0	t	\N	\N
275	1	2019-06-18	1	3	\N	2	0	t	\N	\N
276	1	2019-06-18	1	3	\N	1	687	f	E	\N
277	1	2019-06-18	1	3	\N	1	0	t	\N	\N
278	1	2019-06-18	1	3	\N	2	0	t	\N	\N
279	1	2019-06-18	1	3	\N	1	0	t	\N	\N
281	2	2019-06-18	2	3	\N	5	270	f	E	\N
280	1	2019-06-18	1	3	\N	2	0	t	\N	\N
282	1	2019-06-19	1	3	\N	1	0	t	\N	\N
283	1	2019-06-21	1	3	\N	1	0	t	\N	\N
284	1	2019-06-21	1	3	\N	1	200	f	E	\N
286	1	2019-06-22	2	3	\N	2	0	t	\N	\N
285	2	2019-06-21	1	3	\N	1	0	t	\N	\N
287	2	2019-06-25	1	3	\N	2	0	t	\N	\N
288	2	2019-06-25	1	3	\N	5	0	t	\N	\N
290	1	2019-06-25	2	3	\N	3	0	t	\N	\N
289	2	2019-06-25	1	3	\N	1	0	t	\N	\N
291	2	2019-06-25	1	3	\N	2	0	t	\N	\N
292	2	2019-06-25	1	3	\N	2	0	t	\N	\N
293	1	2019-06-25	1	3	\N	1	230	f	E	\N
294	2	2019-06-25	1	3	\N	2	0	t	\N	\N
295	2	2019-06-25	1	3	\N	2	0	t	\N	\N
296	2	2019-06-25	1	3	\N	1	0	t	\N	\N
301	7	2019-06-27	5	3	\N	5	80	f	E	\N
302	7	2019-06-27	5	3	\N	5	65	f	E	\N
297	1	2019-06-26	1	3	\N	4	0	t	\N	\N
298	2	2019-06-26	2	3	\N	1	310	f	E	\N
299	2	2019-06-26	3	3	\N	2	255	f	E	\N
300	2	2019-06-26	4	3	\N	3	170	f	E	\N
303	7	2019-06-27	5	3	\N	5	180	f	E	\N
304	1	2019-06-27	1	3	\N	1	0	t	\N	\N
305	2	2019-06-27	1	3	\N	1	0	t	\N	\N
306	1	2019-06-27	1	3	\N	1	0	t	\N	\N
307	1	2019-06-27	2	3	\N	2	0	t	\N	\N
308	1	2019-06-27	3	3	\N	4	0	t	\N	\N
309	1	2019-06-27	1	3	\N	2	0	t	\N	\N
310	1	2019-07-01	1	3	\N	1	0	t	\N	\N
313	1	2019-07-03	4	3	\N	8	0	t	\N	\N
312	1	2019-07-02	3	3	\N	1	0	t	\N	\N
311	2	2019-07-01	2	3	\N	2	490	f	E	\N
314	1	2019-07-03	1	3	\N	8	0	t	\N	\N
316	2	2019-07-03	2	3	\N	2	0	t	\N	\N
317	2	2019-07-03	2	3	\N	3	0	t	\N	\N
315	1	2019-07-03	1	3	\N	4	0	t	\N	\N
318	1	2019-07-05	1	3	\N	1	2850	f	E	\N
319	1	2019-07-08	1	3	\N	1	0	t	\N	\N
320	1	2019-07-11	2	3	\N	2	0	t	\N	\N
322	1	2019-07-12	2	3	\N	1	0	t	\N	\N
321	1	2019-07-12	1	3	\N	2	0	t	\N	\N
323	1	2019-07-12	3	3	\N	3	0	t	\N	\N
324	1	2019-07-12	1	3	\N	1	0	t	\N	\N
325	1	2019-07-23	6	3	\N	1	0	t	\N	\N
326	1	2019-07-30	12	3	\N	3	0	t	\N	\N
327	1	2019-07-31	13	3	\N	3	0	t	\N	\N
329	1	2019-08-05	15	3	\N	7	700	f	E	\N
330	1	2019-08-05	16	3	\N	6	140	f	E	\N
331	1	2019-08-06	17	3	\N	22	70	f	E	\N
332	1	2019-08-06	18	3	\N	4	420	f	E	\N
333	1	2019-08-06	19	3	\N	10	385	f	E	\N
334	1	2019-08-06	20	3	\N	3	60	f	E	\N
335	1	2019-08-07	21	3	\N	8	75	f	E	\N
336	1	2019-08-07	22	3	\N	8	0	t	\N	\N
337	1	2019-08-07	23	3	\N	5	420	f	E	\N
338	1	2019-08-07	24	3	\N	1	345	f	E	\N
339	1	2019-08-12	25	3	\N	1	235	f	E	\N
340	1	2019-08-12	26	3	\N	2	0	t	\N	\N
373	1	2019-08-13	27	3	\N	1	135	f	E	\N
374	1	2019-08-13	28	3	\N	1	0	t	\N	\N
375	1	2019-08-13	29	3	\N	5	310	f	E	\N
376	1	2019-08-13	30	3	\N	14	0	t	\N	\N
377	1	2019-08-13	31	3	\N	5	0	t	\N	\N
378	1	2019-08-13	32	3	\N	6	0	t	\N	\N
379	1	2019-08-13	33	3	\N	8	0	t	\N	\N
380	1	2019-08-14	34	3	\N	9	0	t	\N	\N
381	1	2019-08-15	35	3	\N	11	0	t	\N	\N
384	1	2019-08-15	38	3	\N	13	0	t	\N	\N
383	1	2019-08-15	37	3	\N	8	0	t	\N	\N
382	1	2019-08-15	36	3	\N	7	0	t	\N	\N
387	1	2019-08-15	40	3	\N	17	0	t	\N	\N
386	1	2019-08-15	39	3	\N	10	0	t	\N	\N
390	1	2019-08-15	43	3	\N	9	0	f	E	\N
388	1	2019-08-15	41	3	\N	2	0	t	\N	\N
389	1	2019-08-15	42	3	\N	4	0	t	\N	\N
391	1	2019-08-15	44	3	\N	3	0	t	\N	\N
393	1	2019-08-15	46	3	\N	8	0	t	\N	\N
396	1	2019-08-15	49	3	\N	14	60	f	E	\N
397	1	2019-08-15	50	3	\N	10	0	f	E	\N
395	1	2019-08-15	48	3	\N	9	0	t	\N	Mesa 9
392	1	2019-08-15	45	3	\N	7	60	f	E	Mesa 7
394	1	2019-08-15	47	3	\N	8	0	t	\N	Mesa 8
398	1	2019-08-15	51	3	\N	3	60	f	E	Mesa 3,Mesa 5
399	1	2019-08-15	52	3	\N	5	0	t	\N	Mesa 5
401	1	2019-08-15	54	3	\N	7	0	t	\N	Mesa 7
400	1	2019-08-15	53	3	\N	5	0	t	\N	Mesa 5
402	1	2019-08-15	55	3	\N	2	0	t	\N	Mesa 2
403	1	2019-08-16	56	3	\N	7	70	f	E	Mesa 7,Mesa 10
404	1	2019-08-16	57	3	\N	1	0	t	\N	Mesa 1,Mesa 2,Mesa 3,Mesa 4,Mesa 6,Mesa 7,Mesa 8
406	1	2019-08-19	59	3	\N	8	0	t	\N	 8
408	1	2019-08-19	61	3	\N	2	0	t	\N	Mesa 2,Mesa 8,Mesa 12
407	1	2019-08-19	60	3	\N	9	0	t	\N	Mesa 9
405	1	2019-08-16	58	3	\N	1	0	t	\N	Mesa 1
409	1	2019-08-21	62	3	\N	7	140212	f	E	Mesa 7
411	1	2019-08-22	64	3	\N	3	46348	f	E	Mesa 3,Mesa 4
410	1	2019-08-21	63	3	\N	2	50517.6399999999994	f	E	Mesa 2
412	1	2019-08-22	65	3	\N	3	645	f	E	Mesa 3
412	1	2019-08-22	65	3	\N	3	645	f	E	Mesa 3
415	1	2019-08-24	68	3	\N	6	0	t	\N	Mesa 6
414	1	2019-08-24	67	3	\N	18	0	t	\N	Mesa 18
413	1	2019-08-22	66	3	\N	5	0	t	\N	Mesa 5
416	1	2019-08-24	69	3	\N	1	0	t	\N	Mesa 1
417	1	2019-08-24	70	3	\N	2	0	t	\N	Mesa 2
418	23	2019-08-24	71	3	\N	1	0	t	\N	Mesa 1
420	1	2019-08-24	73	3	\N	3	0	t	\N	Mesa 3
423	1	2019-08-25	76	3	\N	7	713	f	E	Mesa 7,Mesa 9
422	1	2019-08-25	75	3	\N	3	0	t	\N	Mesa 3
421	23	2019-08-24	74	3	\N	2	0	t	\N	Mesa 2
419	23	2019-08-24	72	3	\N	1	0	t	\N	Mesa 1
424	1	2019-08-25	77	3	\N	4	0	t	\N	Mesa 4
426	1	2019-08-25	79	3	\N	2	0	t	\N	Mesa 2,Mesa 6,Mesa 7
425	1	2019-08-25	78	3	\N	5	0	t	\N	Mesa 5
427	1	2019-08-25	80	3	\N	1	0	t	\N	Mesa 1
428	1	2019-08-25	81	3	\N	9	0	t	\N	Mesa 9
432	1	2019-08-25	85	3	\N	28	0	t	\N	Mesa 28,Mesa 29
429	27	2019-08-25	82	3	\N	16	0	t	\N	Mesa 16,Mesa 17,Mesa 18
430	1	2019-08-25	83	3	\N	20	0	t	\N	Mesa 20
433	1	2019-08-25	86	3	\N	11	0	t	\N	Mesa 11
431	1	2019-08-25	84	3	\N	1	0	t	\N	Mesa 1
434	1	2019-08-27	87	3	\N	14	0	t	\N	Mesa 14
435	1	2019-08-27	88	3	\N	2	0	t	\N	Mesa 2
436	1	2019-08-27	89	3	\N	12	0	t	\N	Mesa 12
438	1	2019-08-27	91	3	\N	22	193	f	E	Mesa 22
439	1	2019-08-27	92	3	\N	20	0	t	\N	Mesa 20
437	1	2019-08-27	90	3	\N	1	0	t	\N	Mesa 1,Mesa 2
\.


--
-- Data for Name: insumos; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.insumos (id_inventario, cantidad, id_producto, id) FROM stdin;
2	1	81	56
2	2	80	57
2	2	223	58
7	15	146	59
8	7	146	60
\.


--
-- Data for Name: inventario; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.inventario (cantidad, unidad_medida, descripcion, proveedor, marca, ubicacion, id_sucursal, id_inventario, categoria, minimo) FROM stdin;
10	pz	CERVEZA VICTORIA	Cervezeria modelo	Corona	COCINA	3	3	LICOR	\N
99865	gr	CARNE HAMBURGUESA	BODEGA AURRERA	NO HAY	COCINA	3	7	CARNES	1000
19937	gr	TOMATE	NO HAY	MARCA	COCINA	3	8	VEGETALES	1000
1069	pz	CERVEZA CORONA	CORONA	CORONA	COCINA	3	2	LICOR	10
\.


--
-- Data for Name: key; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.key (password, id_sucursal, serial) FROM stdin;
12345	\N	1
\.


--
-- Data for Name: mesas; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.mesas (id_mesa, id_tipo, id_sucursal, ocupada, mesafusionada) FROM stdin;
23	1	3	f	\N
24	1	3	f	\N
25	1	3	f	\N
26	1	3	f	\N
27	1	3	f	\N
30	1	3	f	\N
31	1	3	f	\N
32	1	3	f	\N
33	1	3	f	\N
34	1	3	f	\N
35	1	3	f	\N
36	1	3	f	\N
37	1	3	f	\N
13	1	3	f	\N
15	1	3	f	\N
8	1	3	f	\N
12	1	3	f	\N
22	1	3	f	\N
7	1	3	f	\N
20	1	3	f	\N
1	1	3	f	\N
14	1	3	t	\N
2	1	3	t	\N
19	1	3	t	\N
3	1	3	t	\N
17	1	3	t	\N
4	1	3	f	\N
6	1	3	f	\N
5	1	3	f	\N
9	1	3	f	\N
29	1	3	f	\N
28	1	3	f	\N
10	1	3	f	\N
21	1	3	f	\N
18	1	3	f	\N
16	1	3	f	\N
11	1	3	f	\N
\.


--
-- Data for Name: productos; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.productos (id_producto, nombre, descripcion, precio, id_categoria, id_video, nombre_video, notificacion, ruta_imagen, subcategoria) FROM stdin;
94	REFLEXION	DSJFI	152	79	\N		1	\N	\N
95	MOJARRA AL MOJO DE AJO	234	150	78	\N		1	\N	43
96	ADOBADA	IJSFD	1548	78	\N		1	\N	44
97	enchilada	dsf	1	78	\N		1	\N	44
98	huachinando jaja	dsf	324	78	\N		1	\N	45
99	es otro PRODUCTO	SODJF	234	78	\N		1	\N	46
100	COCTEL DE CAMARON	234	90	78	\N		1	\N	47
101	VODKA PREMIOM	234	555	77	\N		2	\N	34
102	COPA DE LICOR	324	25	77	\N		2	\N	35
103	GOMICHELA	DSF	85	77	\N		1	\N	40
104	SANTIAOG ANTONIO	234	452	81	\N		1	\N	54
105	CONDEJO	324	45896	80	\N		1	\N	\N
106	STARCK	DSF	324	81	\N		1	\N	53
107	aZUL	3QW24FD	324	81	\N		1	\N	51
108	CORONA	DSFJ	1548	77	\N		2	\N	41
109	alejandro gran	sdijf	234	81	\N		1	\N	54
110	vuelve a la vida	ewf	234	78	\N		2	\N	47
116	TOSTADA MIXTA	TOSTADA MIXTA	19	82	\N		1	\N	\N
117	COSTALITO CAMARON	COSTALITO CAMARON 	28	82	\N		1	\N	\N
118	COSTALITO PULPO	COSTALITO PULPO	28	82	\N		1	\N	\N
119	TACOS DE PESCADO	TACOS DE PESCADO	38	82	\N		1	\N	\N
120	EMPENADAS CAZON	EMPANADA CAZON	36	82	\N		1	\N	\N
121	TACO CARMEN	TACO CARME  	38	82	\N		1	\N	\N
122	ESPAGUETTI SIN MARISCOS ROJO	ESPAGUETTI	55	83	\N		1	\N	\N
123	ESPAGUETTI SIN MARISCOS BLANCO	BLANCO	55	83	\N		1	\N	\N
124	ORDEN CAZON	ORDEN CAZON	47	82	\N		1	\N	\N
125	ARROZ CON CAMARON	ARROZ CON CAMARON	65	82	\N		1	\N	\N
127	DEDOS PESCADO	DEDOS PESCADO	69	82	\N		1	\N	\N
128	ESPAGUETTI CON MARISCOS ROJO	ROJO	95	83	\N		1	\N	\N
126	ESPAGUETTI CON MARISCOS BLANCOS	BLANCO	95	83	\N		1	\N	\N
129	PALOMITAS CAMARON	PALOMITAS CAMARON	69	82	\N		1	\N	\N
130	ESPAGUETTI FRUTOS DEL MAR	MAR	100	83	\N		1	\N	\N
131	QUESO FUNDIDO CHAPULIN	QUESO FUN CHAPULINES	89	82	\N		1	\N	\N
132	ESPAGUETTI MEDITERRANEO	MEDI	100	83	\N		1	\N	\N
134	POLLO A LA PLANCHA 	PLANCHA	70	84	\N		1	\N	\N
135	COCTEL CALAMAR	COCTEL CALAMAR	58	85	\N		1	\N	75
136	POLLO EMPANIZADO	POLLOO	70	84	\N		1	\N	\N
137	COCTEL CAMARON	COCTEL  CAMARON	58	85	\N		1	\N	75
138	POLLO ENCENOLLADO	ENCEBOLLADO	70	84	\N		1	\N	\N
139	COCTEL CARACOL	COCTEL CARACOL 	58	85	\N		1	\N	75
140	POLLO ENCHIPOTLADo	Enchipotlado	78	84	\N		1	\N	\N
141	COCTEL CEVICHE 	COCTEL  CEVICHE 	58	85	\N		1	\N	75
142	POLLO A LA DIABLA	POLLO A LA DIABLA	78	84	\N		1	\N	\N
143	CÓCTEL OSTION	COCTEL OSTION	58	85	\N		1	\N	75
144	POLLOBA LA CANTONESA	CANTONESA	78	84	\N		1	\N	\N
145	COCTEL PULPO	COCTEL PULPO	58	85	\N		1	\N	75
146	POLLO A LA VERACRUZANA	CRUZA	78	84	\N		1	\N	\N
147	COCTEL VUELVE VIDA	COCTEL VUELVE VIDA	58	85	\N		1	\N	75
148	POLLO A LA MEXICANA	Mexicana	78	84	\N		1	\N	\N
149	COCTEL CALAMAR 	COCTEL  CALAMAR 	89	85	\N		1	\N	76
133	POLLO PECHUGA ADOBADA	ADONADA	70	84	\N		1	\N	\N
150	COCTEL CAMARON	COCTEL CAMARON	89	85	\N		1	\N	76
151	COCTEL CARACOL	COCTEL CARACOL	89	85	\N		1	\N	76
153	COCTEL CEBICHE 	COCTEL CEVICHE 	89	85	\N		1	\N	76
154	COCTEL  OSTION	COCTEL OSTION	89	85	\N		1	\N	76
155	FILT. PES. AL MOJO DE AJO 	AJO	100	86	\N		1	\N	\N
156	COCTEL PULPO	COCTEL PULPO	89	85	\N		1	\N	76
157	FIL. PES. A LA PLANCHA 	Plancha 	100	86	\N		1	\N	\N
158	COCTEL VUELVE VIDA	COCTEL VUELVE VIDA	89	85	\N		1	\N	76
159	FIL.PES. EMPANIZADO	EMPANIZADO	100	86	\N		1	\N	\N
160	FIL. PES. ENCEBOLLADO	ENCEB	100	86	\N		1	\N	\N
161	COCTEL CALAMAR	COCTEL CALAMAR	110	85	\N		1	\N	77
152	Fil. PES. ADOBADO 	ADOBADO	100	86	\N		1	\N	\N
162	FIL.PESC. AL VAPOR	VAPOR	100	86	\N		1	\N	\N
163	COCTEL CAMARON	COCTEL CAMARON	110	85	\N		1	\N	77
164	FIL.PESC. AJILLO	Ajillo	105	86	\N		1	\N	\N
165	COCTEL CARACOL	COCTEL CARACOL	110	85	\N		1	\N	77
166	FIL.PESC. A LA DIABLA	PESC.	105	86	\N		1	\N	\N
167	COCTEL CEVICHE	COCTEL CEVICHE	110	85	\N		1	\N	77
168	FIL.PES. ENCHIPOTLADO	ENCJI	105	86	\N		1	\N	\N
169	COCTEL OSTION	COCTEL OSTIO 	110	85	\N		1	\N	77
170	FIL.PES. A LA MEXICANA	MEXI	105	86	\N		1	\N	\N
171	COCTEL PULPO	COCTEL PULPO	110	85	\N		1	\N	77
172	FIL.PES. A LA VERACRUZANA	Vera	105	86	\N		1	\N	\N
173	COCTEL VUELVE	COCTEL VUELVE	110	85	\N		1	\N	77
174	FIL.PESC. SALSA CHAPULIN	CHAPU	115	86	\N		1	\N	\N
175	FIL.PESC. EMPANIZADO RELLENO DE QUESILL. Y VERD.	Verdu	130	86	\N		1	\N	\N
176	ENSALADA CASA	ENSALADA CASA	110	87	\N		1	\N	\N
177	ENSALADA CARMEN	ENSALADA CARMEN	110	87	\N		1	\N	\N
113	TOSTADA CEVICHE	TOSTADA CEVICHE	19	82	\N		1	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	\N
114	TOSTADA JAIBA	TOSTADAS JAIBA	19	82	\N		1	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	\N
115	TOSTADA PULPO	TOSTADA PULPO	19	82	\N		1	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	\N
178	FIL.PES. CANTONESA C/CAMARONES	CAMA	150	86	\N		1	\N	\N
181	CALDO CAMARON	CALDO CAMARON	99	88	\N		1	\N	\N
182	CALDO PESCADO	CALDO PESCADO 	99	88	\N		1	\N	\N
184	CALDO VITAMINA	CALDO VITAMINA	140	88	\N		1	\N	\N
185	HAMBUR. ARRACHERA	Arrachera	95	89	\N		1	\N	\N
186	HAMBURG. CAMARON	CAMARIN	95	89	\N		1	\N	\N
179	ENSALADA MARSICOS	ENSALADA MARISCOS 	110	87	\N		1	\N	\N
180	FIL.PESC. EMPANIZADOS RELL. MARISC.	PESC.	165	86	\N		1	\N	\N
183	CALDO MARISCO	CALDO MARISCO	130	88	\N		1	\N	\N
187	HAMBURG. POLLO	Pollo	95	89	\N		1	\N	\N
188	HAMBURG. FILETE DE PESC.	Filete	95	89	\N		1	\N	\N
189	MOJARRA FRITA 	MOJARRA FRITA	90	90	\N		1	\N	78
190	MOJARRA AL MOJO	MOJARRA AL MOJO	90	90	\N		1	\N	78
191	PULPO AL AJILLO	PIL	165	91	\N		1	\N	\N
192	MOJARRA AL VAPOR	MOJARRA AL VAPOR	95	90	\N		1	\N	78
193	PULPO A LA DIABLA	DIABLA	165	91	\N		1	\N	\N
194	MOJARRA ADOBADA	MOJARRA ADOBADA	95	90	\N		1	\N	78
195	PULPO A LA MANTEQUILLA	Mante	165	91	\N		1	\N	\N
196	MOJARRA DIABLA	MOJARRA DIABLA	105	90	\N		1	\N	78
197	PULPO A LA MEXIC.	MEXI	165	91	\N		1	\N	\N
198	PULPO AL MOJO DE AJO	MOJO	165	91	\N		1	\N	\N
199	MOJARRA VERACRUZANA 	MOJARRA VERACRUZANA 	105	90	\N		1	\N	78
200	PULPO A LA VERACRUZANA	VERA	165	91	\N		1	\N	\N
201	PULPO  ENCEBOLLADO	ENCE	165	91	\N		1	\N	\N
202	MOJARRA ENCHIPOTLADA	MOJARRA ENCHIPOTLADA	105	90	\N		1	\N	78
203	PULPO ENCHIPOTLADO	ENCHIPOTLADO	165	91	\N		1	\N	\N
204	MOJARRA POLVO CHAPULIN	MOJARRA EN POLVO 	105	90	\N		1	\N	78
205	CAMARONES AL AJILLO	AJILLO	165	92	\N		1	\N	\N
206	CAMARONES A LA DIABLA	DIABLA	165	92	\N		1	\N	\N
207	HUACHINANGO FRITO	HUACHINANGO FRITO	120	90	\N		1	\N	79
208	CAMARONES A LA MANTEQUILLA	MENTE	165	92	\N		1	\N	\N
209	HUACHINANGO AL MOJO	HUACHINANGO AL MOJO	120	90	\N		1	\N	79
210	CAMARONES A LA MEXI.	MEXI	165	92	\N		1	\N	\N
211	CAMARONES AL MOJO DE AJO	MOJO	165	92	\N		1	\N	\N
212	HUACHINANGO VAPOR	HUCHINANGO VAPOR	125	90	\N		1	\N	79
213	CAMARONES EMPANIZADOS	EMPA	165	92	\N		1	\N	\N
214	CAMARONES A LA VERACRU.	VERA	165	92	\N		1	\N	\N
215	HUACHINANGO ADOBADO	HUACHINANGO ADOBADO	125	90	\N		1	\N	79
216	CAMARONES ENCHIPOTLA.	ENCHI	165	92	\N		1	\N	\N
217	AGUACHILE DE CAMARONES	CAMAR	165	92	\N		1	\N	\N
218	HUACHINANGO POLVO	HUACHINANGO POLVO	135	90	\N		1	\N	79
219	CAMARONES AL MEZCAL	MEZCLA	165	92	\N		1	\N	\N
220	CAMARONES. EMPANI. AL COCO	COCO	175	92	\N		1	\N	\N
222	CAMARONES ENVUELT. TOCINO	TOCINO	175	92	\N		1	\N	\N
221	HUACHUNANGO DIABLA	HUACHINANGO DIABLA	135	90	\N		1	\N	79
224	CREPAS DE MARISCOS	MA	65	93	\N		1	\N	\N
223	HUACHINANGO VERACRUZANA	HUACHINANGO VERACRUZANA 	135	90	\N		1	\N	79
225	CHILES RELL. MARISC.	MARI	90	93	\N		1	\N	\N
226	CAZUELAS DE MARISC.	MARISC	110	93	\N		1	\N	\N
227	HUACHINANGO ENCHIPO	HUACHINAGO ENCHIPO	135	90	\N		1	\N	79
228	ALAMB. MARISCOS	MARO	155	93	\N		1	\N	\N
229	SALMON NARANJA	SALMON NARANJA	170	90	\N		1	\N	80
230	ARRACH. RELL. MARISCOS	MARISC	160	93	\N		1	\N	\N
231	MARISCADA DEL CARMEN	CARMEN	165	93	\N		1	\N	\N
232	SALMON PLANCHA 	SALMON PLANCHA	170	90	\N		1	\N	80
233	SALMON FINAS HIER	SALMON FINAS HIERBAS	170	90	\N		1	\N	80
234	FIL. RES RELL. DE MARIS. BAÑ. CHAPUL.	BAÑADO EN SALSA DE CHAPULIN	170	93	\N		1	\N	\N
235	SALMON SALSA TAM	SALMON SALSA TAMARINDO	170	90	\N		1	\N	80
236	BROCHETA MAR Y TIERRA	MAR	175	93	\N		1	\N	\N
237	SALMON SALSA CHAPU	SALMON SALSA CHAPU	180	90	\N		1	\N	80
238	HELADO NAPOLITANO	Napo	30	94	\N		1	\N	\N
239	HELADO VAINILLA	VAINI	30	94	\N		1	\N	\N
241	HELADO CHOCOLATE	CHOCO	30	94	\N		1	\N	\N
243	FLAN NAPOLITA.	NAPO	30	94	\N		1	\N	\N
245	PLATANOS A LA PLANCHA	Pla	30	94	\N		1	\N	\N
251	PLATANOS SINGAPUR	DINGA	45	94	\N		1	\N	\N
246	PLATANOS FRITOS	FRITOS	30	94	\N		1	\N	\N
248	DURAZNOS ALMIBAR	DURAZNOS 	40	94	\N		1	\N	\N
250	CHESSECAKE DE OREO	OREO	40	94	\N		1	\N	\N
253	CREPAS CAJETA	CAJE	45	94	\N		1	\N	\N
261	CORONA LIGTH	CORONA LIGTH	29	96	\N		2	\N	81
255	CREPA FRUTOS	FRUTOS	45	94	\N		1	\N	\N
256	CREPA LECHERA	LECH	45	94	\N		1	\N	\N
257	CEVEZA MONTEJO	CERVEZA MONTEJO 	29	96	\N		0	\N	81
258	CREPA NUTELLA	NU	45	94	\N		1	\N	\N
259	CERVEZA PACIFICO 	CERVEZA PACIFICO 	29	96	\N		2	\N	81
252	CERVEZA CORONA	CERVEZA CORONA 	29	96	\N		2	\N	81
260	CREPA ROMPOPE	ROMPO	45	94	\N		1	\N	\N
254	CERVEZA VICTORIA 	CERVEZA VICTORIA 	29	96	\N		2	\N	81
262	TECATE ROJA	TECATE ROJA	29	96	\N		2	\N	81
263	TECATE LIGTH	TECATE LIGTH	29	96	\N		2	\N	81
264	DOS XX AMBAR	CERVEZA DOS XX	29	96	\N		2	\N	81
266	CERVEZA SOL 	CERVEZA SOL	29	96	\N		2	\N	81
265	DOS XX LAGER	DOS XX LAGER	29	96	\N		2	\N	81
267	CERVEZA INDIO	CERVEZA INDIO	29	96	\N		2	\N	81
268	MICHE. CORONA	CORO	35	98	\N		2	\N	96
269	MODELO ESPECIAL	MODELO ESPECIAL	33	96	\N		2	\N	82
271	MICHE. VICTORIA	VICTO	35	98	\N		2	\N	96
270	NEGRA MODELO	NEGRE MODESO	33	96	\N		2	\N	82
273	MICHE. PACIFICO	PACIFICO 	35	98	\N		2	\N	96
274	BOHEMIA CLARA	BOHEMIA CLARA	33	96	\N		2	\N	82
272	MICH. MONTEJO	MON	35	98	\N		2	\N	96
275	BOHEMIA OBSCURA	BOHEMIA OBSCURA 	33	96	\N		2	\N	82
276	MICHE. CORONA LIGH.	LIGHT	35	98	\N		2	\N	96
277	HEINEKEN	HEINEKEN	36	96	\N		2	\N	83
278	MICH. TECATE ROJA	ROJA	35	98	\N		2	\N	96
280	MICH. DOS QUIS AMBAR	AMBAR	35	98	\N		2	\N	96
279	MICHE. TECATE LIGH	LIG	35	98	\N		2	\N	96
282	SUERO CORONA	SUERO CORONA	35	99	\N		2	\N	105
281	MICHE. DOS EQUIS LAGER	DOS	35	98	\N		2	\N	96
283	MICHE. SOL	SOL	35	98	\N		2	\N	96
284	SUERO VICTORIA 	SUERO VICTORIA 	35	99	\N		2	\N	105
285	MICHE. INDIO	INDIO	35	98	\N		2	\N	96
286	SUERO MONTEJO	SUERO MONTEJO	35	99	\N		2	\N	105
287	SUERO PACIFICO	SUERO PACÍFICO 	35	99	\N		0	\N	105
288	MICH. CORONA SABORES	SABORE	40	98	\N		2	\N	97
289	MICHE. VICT. SABORES	SABIR	40	98	\N		2	\N	97
290	SUERO CORONA LIGHT	SUENO CORONA LIGTH 	35	99	\N		2	\N	105
291	MICHE. MONTEJ. SAB.	SAB	40	98	\N		2	\N	97
292	SUERO TECATE ROJA	SUERO TECATE ROJA	35	99	\N		2	\N	105
293	MICHE. PACIF. SABORES	SAB	40	98	\N		2	\N	97
294	SUERO TECATE LIGTH	SUERO TECATE LIGTH	38	99	\N		2	\N	105
295	SUERO XX AMBAR	SUERO XX AMBAR	35	99	\N		2	\N	105
296	MICHE. CORONA LIGHT SABORES	Sa	40	98	\N		2	\N	97
297	MICHE. TECAT.ROJA SABORES	SABO	40	98	\N		2	\N	97
298	SUERO XX LAGER	SUERON XX LAGER	38	99	\N		2	\N	105
299	MICHE. TECAT. LIGHT SABORES	SABORES	40	98	\N		2	\N	97
300	SUERO SOL	SUERO SOL	35	99	\N		2	\N	105
301	SUERON INDIO	SUERO INDIO	35	99	\N		2	\N	105
303	MICHE. 2 EQUIS LAGER SABORES	SABO	40	98	\N		2	\N	97
304	SUERO MODELO ESPE	SUERO MODELO ESPECIAL	39	99	\N		2	\N	106
302	MICHE. 2 EQUIS AMBAR SABORES	AMBAR	40	98	\N		2	\N	97
305	MICHE. SOL SABORES	SABOR	40	98	\N		2	\N	97
306	SUERO NEGRA MODELO	SUERO NEGRA MODELO	39	99	\N		2	\N	106
307	MICHE. INDIO SABORES	SABORES	40	98	\N		2	\N	97
308	SUERO BOHE  CLARA	SUERO BOHEMIA CLARA	39	99	\N		2	\N	106
309	MICHE. CORON CON MARISC.	 Ma	60	98	\N		2	\N	98
310	SUERO BOHE OBSCURA	SUERO BOHE OBSCURA	39	99	\N		2	\N	106
311	SUERO HEINEKEN	SUERO HEINEKEN 	42	99	\N		2	\N	107
312	MICHE VICT. CON MARISC.	NA	60	98	\N		2	\N	98
313	MICHE. MONTEJ. CON MARISC.	MARISC	60	98	\N		2	\N	98
314	MICHE. PACIFI. CON MARISC.	MARISC	60	98	\N		2	\N	98
315	CLERICOT	CLERICOT	60	100	\N		2	\N	\N
316	VTF CHAUVENET	VTF CHAUVENET	70	100	\N		2	\N	\N
317	VBF  CHAUVENET	VBF CHAUBENET	70	100	\N		2	\N	\N
318	MICHE. CORONA LIGHT CON MARISCOS	 Maro	60	98	\N		2	\N	98
319	BEBIDA CONGA	BEBIDA CONGA	36	101	\N		2	\N	\N
320	MICH. TECATE ROJ. CON MARISC.	D	60	98	\N		2	\N	98
321	CONGA DEL CARMEN	CONGA DEL CARMEN	40	101	\N		2	\N	\N
322	MICHE. TECATE LIGHT CON MARISC	NSS	60	98	\N		2	\N	98
324	PIÑADA	PIÑADA	45	101	\N		2	\N	\N
323	MICHE. 2 EQUIS AMBAR CON MARISC.	AMB	60	98	\N		2	\N	98
326	CAFE AMERICANO	CAFE AMERICANO	30	102	\N		2	\N	\N
327	CAPUCCINO	CAPUCCINO	35	102	\N		2	\N	\N
328	MICHE. SOL CON MARISC.	MARIS	60	98	\N		2	\N	98
325	MICHE. DOS EQUIS LAGER CON MARISC.	MARISC	60	98	\N		2	\N	98
329	CAFE EXPRESO	CAFE EXPRESO 	30	102	\N		2	\N	\N
330	MICHE. INDIO CON MARISC.	ADMIN	60	98	\N		2	\N	98
331	MICHE. INDIO CON MARISC.	NAJS	60	98	\N		2	\N	98
332	AGUA EMBOTELLADA	AGUA EMBOTELLADA	16	103	\N		2	\N	\N
333	REFRESCO COCA COLA	REFRESCO	22	103	\N		2	\N	\N
334	REFRESCO COCA LIGTH	COCA LIGTH	22	103	\N		2	\N	\N
335	COCA COLA CERO 	COCA COLA CERO	22	103	\N		2	\N	\N
336	REFRESCO SIDRAL	REFRESCO SIDRAL	22	103	\N		2	\N	\N
337	REFRESCO MANZANA 	REFRESCO MANZANA 	22	103	\N		2	\N	\N
338	REFRESCO SPRITE	REFRESCO SPRITE	22	103	\N		2	\N	\N
339	REFRESCO FANTA 	REFRESCO FANTA	22	103	\N		2	\N	\N
340	REFRESCO FRESCA	REFRESCO FRESCA	22	103	\N		2	\N	\N
341	MICHE. MODELO ESP.	ESP	39	98	\N		2	\N	99
342	AGUA MINERAL	AGUA MINERAL	22	103	\N		2	\N	\N
343	MICHE. NEGRA MOD.	MO	39	98	\N		2	\N	99
344	MICHE. BOHEMIA CLAR.	Haha	39	98	\N		2	\N	99
345	MICHE REFRESCO	MICHELADA REFRESCO 	28	103	\N		2	\N	\N
346	MICHE AGUA MINERAL	MICHE AGUA MINERAL	28	103	\N		2	\N	\N
347	MICH. BOHEMIA OBSC.	JAJS	39	98	\N		2	\N	99
348	SUERO DE RERESCO	SUERO DE REFRESCO	28	103	\N		2	\N	\N
349	SUERO AGUA MINER	SUERO AGUA MINER	28	103	\N		2	\N	\N
351	MICH. NEGRA MODE. DE SABORES	SABO	44	98	\N		2	\N	100
350	MICH. MOD. ESPECIAL DE SABORES	SAB	44	98	\N		2	\N	100
352	MICH. BOHEMIA CLARA DE SABORES	SABO	44	98	\N		2	\N	100
353	MICHE. BOHEMIA OBSCURA DE SABORWS	SABO	44	98	\N		2	\N	100
354	MICHE. MODELO ESPE. CON MARISC.	MAESPC	66	98	\N		2	\N	101
355	MICHE. NEGRA MODELO CON MARISC.	MA	66	98	\N		2	\N	101
356	MICHE. BOHEMIA CLARA CON MARISC.	Boh	66	98	\N		2	\N	101
357	MICHE. BOHEMIA OSCURA CON MARISC.	MICJE	66	98	\N		2	\N	101
358	MICHE. HEINEKEN	HEINEKEN	42	98	\N		2	\N	102
359	CLAMATO NATURAL	CLAMATO NATURAL	27	105	\N		2	\N	117
360	MICHE HEINEKEN DE SABORES	SABORES	48	98	\N		2	\N	103
361	CLAMATO MARISCOS	CLAMATO MARISCOS	47	105	\N		2	\N	118
363	MICHE. HEINEKEN CON MARISC.	MARISC.	70	98	\N		2	\N	104
416	GLOBO DE AGUA TEMORADA	TEMPO	40	108	\N		0	\N	132
364	CLAMATO CORONA	CLAM. SOLO CORONA	45	105	\N		2	\N	119
365	CLAMATO VICTORIA	CLAM. SOLO VICTORIA 	45	105	\N		2	\N	119
366	CLAMATO  MONTEJO	CLAM. SOLO MONTEJO	45	105	\N		2	\N	119
367	CLAMATO PACIFICO	CLAM. SOLO PACIFICO 	45	105	\N		2	\N	119
368	CLAMATO CORONA LIGHT 	CLAM. SOLO CORONA	45	105	\N		2	\N	119
369	CLAMATO TECATE ROJA	CLAMATO TECATE ROJA	45	105	\N		2	\N	119
370	CLAMATO TECATE LIGHT 	CLAMATO TECATE LIGHT 	45	105	\N		2	\N	119
371	CLAMATO XX AMBAR	CLAMATO XX AMBAR	45	105	\N		2	\N	119
372	CLAMATO XX LAGER	CLAMATO XX LAGER	45	105	\N		2	\N	119
373	CLAMATO SOL	CLAMATO SOL 	45	105	\N		2	\N	119
374	CLAMATO INDIO	CLAMATO INDIO	45	105	\N		2	\N	119
375	CLAM.MARISCO CORONA	CLAMATO MARISCO CORONA	65	105	\N		2	\N	120
376	CLAM.MARISCO VICTORIA 	CLAM MARISCO VICTORIA 	65	105	\N		2	\N	120
377	CLAM.MARISCO MONTEJ	CLAM.MARISCO MONTEJ	65	105	\N		2	\N	120
378	CLAM.MARISCO PACIFICO	CLAM.MARISCO PACIFICO 	65	105	\N		2	\N	120
379	CLAM. MARIS.CORONA LIGHT 	CLAMATO MARISCO CORONA LIGHT 	65	105	\N		2	\N	120
380	CLAM.MARISCO TECATE ROJ	CLAM.MARISCO TECATE ROJA	65	105	\N		2	\N	120
381	CLAM.MARISCO XXAMBAR	CLAM.MARSICO XXAMBAR	65	105	\N		2	\N	120
382	CLAM.MARISCO XXLAGER	CLAM.MARISCO XXLAGER	65	105	\N		2	\N	120
383	CLAM.MARISCO SOL	CLAM. MARSICOS SOL	65	105	\N		2	\N	120
384	CLAM MARISCO INDIO	CLAMATOS MARISCOS INDIO	65	105	\N		2	\N	120
385	CLAMATO MODELO ESPE.	CLAMATO MODEÑO ESPECIAL 	48	105	\N		2	\N	121
386	CLAMATO NEGRA MOD	CLAMATO NEGRA MODELO	48	105	\N		2	\N	121
387	CLAMATO BOHE. CLARA	CALAMATO BOHEMIA CLARA	48	105	\N		2	\N	121
388	CLAMATO BOHEMIA OBS	CALAMATO BOHEMIA OBSCURA	48	105	\N		2	\N	121
390	CLAM. MARISCO NEGRA MOD	CLAMATO MARISCO NEGRA MODELO	68	105	\N		2	\N	122
389	CLAM MARISCO MODELO ESP	CLAM MARISCO MODELO ESP	68	105	\N		2	\N	122
392	CLAM. MARIS BOHEMIA OBS.	CALAMATO BOHEMIA CON MARISCO	68	105	\N		2	\N	122
391	CLAM. MARISCO BOHEMIA CL	CLAM MARSICO BOHEMIA CLARA	68	105	\N		2	\N	122
393	CLAMATO HEINEKEN 	CLAMATO HEINEKEN 	52	105	\N		2	\N	123
394	CLAM. MARISCOS HEINEKEN	CLAMATO MARISCOS HEINEKEN 	72	105	\N		2	\N	124
395	VASO HORCHATA	ORCH	16	108	\N		2	\N	131
396	VASO JAMAICA	MASO	16	108	\N		2	\N	131
397	VASO DE AGUA LIMÓN	VASO	16	108	\N		2	\N	131
398	VASO NARANJADA	NAR	16	108	\N		2	\N	131
399	VASO NARANJADA CON MINERAL	MIN	20	108	\N		2	\N	131
400	VASO LIMONADA CON MINERAL	MINERAL	20	108	\N		2	\N	131
401	VASO GROSELLA CON MINERAL	MINERAL	20	108	\N		2	\N	131
402	VASO MANGO PIÑA 	AS	20	108	\N		2	\N	131
403	VASO ALBAHACA	ALBAHVA	20	108	\N		2	\N	131
404	VASO PEPINO CON LIMON Y GENGIBRE	PELI	20	108	\N		2	\N	131
405	AGUA DE TEMPORADA	TEMPRADA	20	108	\N		2	\N	131
406	GLOBO HORCHATA	ORC	32	108	\N		2	\N	132
407	GLOBO JAMAICA	JAMA	32	108	\N		2	\N	132
408	GLOBO LIMON	LIMON	32	108	\N		2	\N	132
409	GLOBO NARANJADA	NARANJADA	32	108	\N		2	\N	132
410	GLOBO NARANJADA CON MINERAL 	MINERAL	40	108	\N		2	\N	132
411	GLOBO LIMONADA CON MINERAL	MINERAL	40	108	\N		2	\N	132
412	GLOBO DE GROSELLA	GROSELLA 	40	108	\N		2	\N	132
413	GLOBO MANGO PIÑA 	PIÑA	40	108	\N		2	\N	132
414	GLOBO ALBAHACA	ALBAHACA	40	108	\N		2	\N	132
415	GLOBO PEPINO CON LIMON Y GENGIBRE	GENGIBRE	40	108	\N		2	\N	132
417	MEDIA JARRA HORCHATA	ORCH	55	108	\N		2	\N	133
418	MEDIA JARRA JAMAICA	Jamaica	55	108	\N		2	\N	133
419	MEDIA JARRA NARANJADA	NARANJADA	55	108	\N		2	\N	133
420	MEDIA JARRA NARANJADA CON MINERAL 	MINERAL	65	108	\N		2	\N	133
421	MEDIA JARRA LIMINADA CON MINERAL 	MINERAL	95	108	\N		2	\N	133
422	MEDIA JARRA GROSELLA CON MINERAL 	MINERLA	65	108	\N		2	\N	133
423	MEDIA JARRA MANGO PIÑA 	MANGO PIÑA 	65	108	\N		2	\N	133
424	MEDIA JARRA ALBAHACA	JARRA	65	108	\N		2	\N	133
425	MEDIA JARRA PEPINO CON LIMON Y GENGI.	MEDIA	65	108	\N		2	\N	133
426	MEDIA JARRA DE AGUA TEMPORADA	TE	65	108	\N		2	\N	133
427	JARRA HORCHATA	ORCH	100	108	\N		2	\N	134
428	JARRA JAMAICA	JAMAICA	100	108	\N		2	\N	134
429	JARRA LIMONADA	LIMONADA	100	108	\N		2	\N	134
430	JARRA NARANJADA CON MINERAL	NARANJADA	120	108	\N		2	\N	134
431	JARRA LIMINADA CON MINERAL	MINERAL	120	108	\N		2	\N	134
432	JARRA GROSELLA CON MINERAL 	MINERAL	120	108	\N		2	\N	134
434	JARRA ALBAHACA 	JARRA	120	108	\N		2	\N	134
435	JARRA PEPINO CON LIMON Y GENGIB.	JARRA	120	108	\N		2	\N	134
433	JARRA MANGO PIÑA 	MINERAL	120	108	\N		2	\N	134
436	JARRA AGUA DE TEMPORADA	TEMPORADA	120	108	\N		2	\N	134
112	TOSTADA CAZON	TOSTADA CAZON	19	82	\N		1	/9j/4AAQSkZJRgABAQAAAQABAAD/2wBDAAoHBwgHBgoICAgLCgoLDhgQDg0NDh0VFhEYIx8lJCIfIiEmKzcvJik0KSEiMEExNDk7Pj4+JS5ESUM8SDc9Pjv/2wBDAQoLCw4NDhwQEBw7KCIoOzs7Ozs7Ozs7Ozs7Ozs7Ozs7Ozs7Ozs7Ozs7Ozs7Ozs7Ozs7Ozs7Ozs7Ozs7Ozs7Ozv/wAARCAEsASwDASIAAhEBAxEB/8QAHAAAAQUBAQEAAAAAAAAAAAAAAQACBAUGAwcI/8QAOxAAAQMCBAQDBQYGAgMBAAAAAQACAwQRBRIhMQYTQVEiYXEUMkKBkQcVI1KhwSRisdHh8BZTM0Pxcv/EABoBAAIDAQEAAAAAAAAAAAAAAAABAgMEBQb/xAApEQACAgEEAQQCAgMBAAAAAAAAAQIRAwQSITFBEyJRYQUyQqFxgbGR/9oADAMBAAIRAxEAPwDzjOeyWc9l15YRETe60Uyo5cw9kuaV15TUuU3uimBz5p7Jc09l05QS5QJT5AYJUeb5J3JCXJb3RyHA3m+SPN8k4RDujyR3RyHA3mo8022REI7pwhHdNWAzm+SPN1R5AvunCAd0CAH3Rz+SeIQEuSExDM90Q9PEI7o8jVAWjnnt0R5g7LoacHql7P5oEM5g7JczyXQU/mj7N5oGcxIClzAuopvNH2XzQKzlzBfZDP5WXYUyXsyAtHMSI836p/IsEjT36oDgYJgnCcJezeaPsx7oDgPObdLnNSFMUfZXd0EeBc8eaQnaj7I7yS9kd3TDgPOaVYYfVxxjaxGxVf7M5PZC+PUWurMc3Fi4NBDiPt7/AGWoYNdj3C4TYVBTSlg2Oo1VdSSSRzCQkBzTdW5xCKfxvZZ2xC1766Isxd0kkFzi8ddK6bdFABukCglfumA66V0AUggB6KbdIFAh4CNk0FOugBBOugEQLoAIRKATkCHNRQARsgTHBEIAI2QIQTggAjZABBRJSGyRCAGk6JIhuqdlQAzzRATrIgboEABJOtslZAACe0JoCcEERwKSSQ3TANtkULopiI9THIfE07LpC2QxAldALppkDDZXQnSHbKJBKyN7LMXiKCR0SugAgoXRQTAKIQSQA5EJoRCAHBPCa1FAhwRBTQE4BADgnJoCcAgQ4FOCAF07KgixIhOa26tsbwqLDPY42kmWSmbJKD0cbqN06GVCWyeQgRqpCECikAiUCBZLVOCIAQAwI2KdZEBAhuvySOyfsggABEBJEJiCAjayQRQIB0SCJSsmAQgWtJ1AKOiOyYjO3SSSVZpEUEboFMAodUEeiQxyIQBRCBCIRCSITEOCemgXKIQIcE4JoT0AK1k4eiQRAQA4BPaLlABdWBIiXHD3D1ZjE4fBEHRQvbzSTawJ/XqpHE5fX8U1McLS8tkELGt1vbSw+a2/2dwtj4cMgHikmc4/KwUjDuGY6TiytxIsHLID4R2c6+b/AHzWZZLk2x1wmeW4lhNZhVRyK2ExSFocAddFCIsV7NxLg1Hi0UDqllzE42INt+ippeGMGdT8p1PGzzbofqoS1ag6plkcMpco8yCS9Cl4Owgs8Bc2+lw9RpOBKUgCOqka49wCktbj6aaJPTzMQAiAtW/gOrF+VUxvt0IIUR/BmMMaS2Jj7dGv1Vq1WF/yKnimvBQWsjZSKmgq6R2Wop5Iz/M3RcLWV6kpcpkGmgEIWRSUhCshZO6IJiDZJJJAhIpa2StZMBC6N01FAjPIpIKBqEkkkgQrI2SCQQArIjVHdGyYACcEgE4IEIXTgkAnAIEEXTgCkAnAIAQBTh2Sbou0LmxzMe9gka1wJY7Zw7JN0I6UcBqquKAbyPDb+pWqruDhHigjheWUwYCbm7r9VF4eoIK/iFlTTN5dPHK1wZe5Guy9IxalZyTOBq3f0XKz6ic0/RfK7Jwim1fRy4XjhosPbSRHwsJIudddVeTnLEHjYbrG0VQ+jmEwcDG0BrwTre+hWspZ2VlK4B3vg28lRps13jl2TkqdFJxDiTYYI23NnO1sFkcTxWdpDKZzgWjVXMrpmYnUQV7QGscOW4bEHZVmM4eIqi7Gkh9tB1XT08U6c+z0OgjjhUZIgMxbEDYh+gubFW8WM1kpaHR2dl2C4z4MBTMmzZQNSp0FN7RJA+K2UtuSBe4WqUMb8G7JLBJWkifhlVNPMWyNsWMuVZGYN0JshQU0bTI8Ns52mo1sEKqONkbpDqRtbr5LHPBjk6o4eRwnkpID2xTsdna17diCLrN4rwfS1LXS0P4Eu+U+6f7K3lZNG1kcV8x8T7dFPZYRtbJYSP6LBl0mXC9+CX+ivLgVfJ5NV0NRQzOhqIjG4d9j6LhlXq+I4RTYlC6CoYDpo8bsPkvOMXwmowqsdBM3Tdjxs4d1s0mr9ZbZKpI5eTG48+CuskQnWSIW8pG2QtdPQATAQCa4FPGiWhTEcwCnahONrIIAzqSV0lA0iSQRBQAUU1EapgFEJAaI2QAgiELIhAh4KeCuYTggDoDonArmCnoEPBXaKN8pOUXyi5PkuAWnwDCjPhNRMR4pS1rfTMFi1uo9DE5eekNRuzS8HYMyk5NRrnk1d6BaPiSrEGB1RLrEssPUmwUehDaFxjdo2JgjB7nqqjiHGIJy6AtL2REFxtcF3Ro81x8GWOKLt2/JbDbCcb6RX4dJUS4g6VjXSMdFaRjtgBsT+qvcKrTRVTXhxMBIBBNy2/f+6oMGfOYqirkfJFECM77ZRY/2suWJYxRUUjJqCWWeN3ge1zQD5kdv3WG5zy77oMkouVvizY8Q0ueTmNtlmbdh7O7f0VNidbyaKOb2czEENe0bt7qXh+O0eKYZ7KJiXx2czM3X0XUQNLCHhtn6hzdQV0MWvjizbZfq/wCma9NqFFpS5Rzc+Gqw3O5pEZbe1tbK2weCGKiaI22a1oy3UekpcrWt0LQLWVk2PIwNbou3vtcFubKmtq6sVOWl0spGl8q6OiikAOUG2oXJ7ZGMEUTfMuO11zp4JmzcyZ+a2jWtFkFVJ+5M51ML4mPMd+Y7ra65zZWBjneKcjwjt5qfLI2+TQvPRQqyCWJrnR2Mj+p6Kxc9mjG91JjIKoBzIc2Z5Hicm41g8GMUJheAJBrG/q0qHAy2YRuJcPef59Vb0jwYhcknayx6nT0/Uh2hanClyjyKrpZaKpkp5m5ZIzYhR916FxrgntVN7fAz8WIeO3xN/wALz4rTgy+pC/JxJx2ugJBC6KvIBQskkpCElZJK6BGbBRTUuqgahySARCAEiEEQmA8IpqIQIKKATgEAOATgLIBOGqBCCcAjGwOeATYHrZaLDeDMQxOB8tPLTlrDaxeQfpZVzyRi+WNJvoz4C22DYrAxtFhdJllfo6U9AAbqjruEMepcw9laGDd/Mbt33Vph0NLhLW08bWulI/EqCNb+XkuF+Uy+pFUnx0WwhOm0jvxFxYyOompqN+Z1yHOG176qxocboabA4I24bFNiMjWloO5vu47psfDmG1tN4KMNcf8A2NGt0qPCvulxzss1o1kPb9lx/X2QbjF39oqlDIpKyzMdZitJy8SrYqM3DmCNoIAA21v9VUScBz1EjpY6ozWN80cjTf5KUKyKdsr2vGe1rX0XAZ3PD3SFjm6gt6LPDVT/AJkpJPxZ3pOGq6hkBFPLYG/hF9VfwRPZHndE9hd7zHAgX7hVlPK98IHPkL9sxcV1EdU6zS8ubtcuVa1UFK0rLYw4Sos2fhyBzDmH5b7KwhfzBmFtO6z8VFVAgtIaB8V1aUdJOxwe+oc49rLraHU5m6UHROizYM2t737LpygdRuuDJMmjxlPQ9F3aHHc28l6KLTXDF0R5YC19wzxb3K5tppJWETHfVS3yPYAA0uB6dk18T5G6OyqyLZbHI0iBLyoGlsYa4jdrd1ziLy8Oc0tb0Y0b+qkMoGxyGV7/AJAWXUvJaWxMIt1KsdNUXuaqlyNewSRlr2jKRa3kvK+JcHOE4o+NrbRSeKM+XZeqMY/43fMqh4zwwVuDumYLyU/iHmOqxQfpZfpnPzRs8ysjZEixSsukYwFt0LWTigpCG2Ry3QKQ1QBmUUzmtSErVXZpHhO2XPmt7o81qYD0gmc1vdIStQM6hOXITN7pwmb3RYjqAnBchMxETM7o4FR3CcFwE7Anidu19UWFMkMNjcaHuFuOFKj7koRX1EjiKg3LSdmjr67rM0eGNyMlq38tpF7dvVPxPFY53Njj8MEYs0O2XH1eqjP2Y+fse2aqj1p/s+K0jZYZA+ORtwRsQs4/hBxqXlk4DXOByuWV4W4omw6uLNZKVwvKLaM/mC9TpnUmKUrKmmcyRjxmDgL39FVgyNyqao6eDPPGuBYXQvoochc22+66zUtS6dro3Quj+Jr2/wBCuJkEH4csLntvbM1ulvquvtDIyAyN1j1A0XX2JrqwcZSk5d2SZKGndHlMERNratCrJcBgkGdrGtJ/JsptFVzTvdnhLWX0LnC4+QU57fAcm6oy6bFNVKKMzi8bplFHgzmN7HuukuFzEAskAt3VwGHlgOPitrZC1weizrQ4I9RH6jK+CJ7YxDPYk+64bXXdgLbKTkFiCLgpCOx136Iw4fR9q6It2MHiHiGnZJuaM+EFw/Kdx6LoGkI6+i0uNkRNeHg23G47Jt8rjmLjdOyBxDr+IdQnPuNm3U1fkE/BHMbBdrWk36oEuYwBoaLdypV8rLu1UR7og/wsBzDqpoti9xwLbyZnyg+QTpI2SwuicLtcC03TRUmxPJAANk90peL5badFj1XEdwZEzyCvpjR101O7eN5aoyuOOHtpOIpdLCVjXj+n7LNnEGd1vxT3QUjmuLuiWUFCOIM7hA4izurbFtZMISyqD94sR+82d07FsZlsrkbP7qRYI6KijXZHyvSyuUnRHRFBZGyvRDHqTYIgBOgsjZHohj1JACcAEUKyMGPKcI3qSLJ7W3IAFyh8IExlLQTVDw0X1+qsY8OdTu5g0LOp7qyoJW0lRHM+dkbwAQ4gnK4Dy+ibWV9JJJmjbI8k3c92lyQL/rdcTLnyTfD4NkYRXBxmr5RAHyAu0s1rtSfM+SqS+abM/K0WOpA1Vo+Js9FJUxZQxjrWcdT8lyhw2WYGzC0He7rKvFOOJ3JEnBNUh0FJVOoWQwNL5ak3d5NGwv6rW8JVuJ8Pv/iTelcTnhvmI/mFtAf6qHT4UWYfTFsrgAwsfZ25BvqpUUTW2a5oIA3WTPrr4j8k8UF/I9PpKuDEaZssLw5rhuOq5yQxxh2fO8HosNh+JzYTNzITmid78Z2P+Vt8MxWmxSmEkL7n4mndp7FbtF+QUltn2EoPHyuh9PzInFuRjY+lhquhqJ21DWtYHsO/cfNObRgSGQvNu108zxMeI2i58hsuzuT5RU5Ju0rO4OmpRtrdRA9z5XNcC0N2I2KkNsG6dOyTRS4UOGpI69kbXFuoSabtvsiRdRaIDbXHmmkAdUfmjlDgQ4XBSQ0NDbfy+i6h9m33CbYEW6JpYQPCbqYdhMzXgZRcKPNEx776tPcLuI2yM1bYqLUl4dkY+xv1TRZjXPAxwfGbc3Q92oh5c2xcCO4XNzp+ZpIwtt7pGqTXuLPFGGnyWXU/oyU1xZ519pdHnr6OYbuiLT8j/lYR1G9ej/aHbNRX3s/9liSArdFzgiYZupMrDRPTfYnnurMgWsgbLZRHcys9ieh7C9WZAS+qKDezNgparet4Ojt7q6t4Ph6j9FGiW/6PPdUQT2K9EPCEAHupf8Rh/KED3/R56L9kRe+xXoreEKf8oTxwlT/lQLe/g85Ad2KcA7sV6M3hSmG7U8cL0w+FAbn8HncQaHXkje4dhpdS6Z7pJ2xNibGx24A3+a3zOGKUfAFnsepoqLEoooWi7GXd8/8A4suqaWNssxNuSIdREwRFoF2jfyVJVRkO8TzY7aq0lm9431J6bKmq6kyPNru7BcfCnZulR2p6nLE6C7jm21Wkwudr4WjcrIUAnnqQIb80mzbG1vNbXC8FbTsy105imIuGjYeqjq4LbyTxpyfBc0UrDC+F9y3cW3B6Jkha3Ygeqm4aI6FwiBD897ykg37DyTMSwM1FTDWREspjfPGLjXpr0C5EcSlJpM0uG3kqZ66OMFpeAFEpuJZqKrD6GXK4bm+hHY91Lm4SZiGIueyYtg0sxt7k9dUpeB5IGONNKQdTlfqD/ZbMeLGkTg+al0b7h3i6lxhgiktFUAatJ0cf5T+y0Dg1zSY7Bx6rw+IPwycNldy3t1Gu62GC8eRxFsNe8uZsJBqR691qxavJidNWiGbRr9sf/htxKY5i1xLgfkAjDPRxuc+OQZicpA1N/RCCopq6JskT2SMdqHNNwV0NHE2ZkojFx1Xaw6jHmVxZjddPhkqZ7WMBfe1xsLp4uetwuDpfCb+EaWd3RiqWGTknR+qtoocXXQ8tObMPpdOBLdOibkcHudnJB2HZFheY/GPEOyi1fJFj8oBug8OyEsIuO6YyUOFibD+i6taA4kdUJifHY2OUO8LtHdlCrmnO0kOsDcOH7qa+IXzde6jSSgNLZLFt7AhSTLMbqVog8+HOM7LEDRzVIPhj3zC2ijyUoMwdGS0HU22K6uFhba5WXVyShwTzONKjB8dR1FXiMEcTCWxRanzJ/wDiyxwqsO0RXqNRTRzzukcLkrmKGEfCFrwR9PGonPkm3Z5icIrf+oofdFb/ANZXqHsUP5Qh7FCPhCu3EdjPMfuat/6yh9z1o+Ar1D2KH8oS9ih/IEbg2P5K7InBoTrXQsokhvLuUsieNkrJiGgZUiiWkoZbboGEAWSACXkqXifiJmAUjMjQ+pmuI2nYdyVGTSVslFNukWtXWUtBAZqqdkTB1cV59xLiVDUY1LJRVAlu1uYtFwSBbQ9eizuJYrWYhUGarlMjztmOgHkOi50FSKaQvbkc87ZhdYc01ONUa4YtruywEsbyOZnDewCsYqGjrMj4Gtia3cgG7iFNp66jrqFsc9Daw0e1UzK5tBKWlr3MZfKLrGq6RpUfkvcMgpaWoe9kYM1tXEaqa9zqyW8ly7Ynuq3DpqXEZs8M5Y7qDoVawNkbVg52vaNnDb5rJlxy3cl8JJdHJjZ6R4fG0+bTsVqsHxM1ED6eUAZm6sPUKBPPBHSOfYOkA8LW9Ss/htRVMxOSauiewOPhcATYdtFT6bxz3rku3LJGmb2hphTnx2ybjVVXE3EtLh1LIIwHEg2aDqVW4zxDTwRspaaubFI/wlpaS637Kvbw+K6rLJ5eY2wIeRY+euys3qC29IgsdvczG12JVmJOAew2vcD/ACu9DQyveNQ0dTZbx/BQkp+ZCLtYNyBdUVThNXh5dJG4uFrObl1AU5ZeKSotxqN23bJWE4pVYC+0c2aIkF0b9j/b1Xo2DcQQYjE0ZrO6sduP7heQObM95ZI197XDgDb6qfSYhLDDHklLXN0vbUeixvHKEvUg6kW5cMMq+z2rIyRhsdDqucsJLnX2IsCNwsTgPGpaWw19xrYSnQH1H7rcU9ZDUxgscDcLrab8ipPZk4l/05WXFkxPnoQe8Uw5J8QFhmHZNjqJOY1pHi+IW09QurmEA5fVQ2GRlV4ybG7QurFpkIpSTJMmUyFjQW5uoXXmtyjWxYo7HiRxa8We3RIvs4P2B0N+ilQtpJdMDHzWHMOoCjPAdd7LHNqWlMFSIh7ngJ8VkiwNk5gPhOoAUJPb2JR2jGB0YNhdp+E9FznfYF23QKQ7XV2mllXzyh77N91uyx7XmyJ+EZ8krYwoFK6Oi6RSAFJKyVkCEDZK6NkLIAqQSntZfcrmXta26aZ0xEglrAuZk1XDmX3KBkHRAHcyW2TTJdcuZdNLwEAdi5ea8f1PtOPMhANoIg366/uthxDDiNXhxZhlQYZr6gG2Ydr9F53W4bW0lW9tYS+RgGc5s2+o1WbPOlRpwQuVla2Ivku69gmujyE3N7BTbBrL5bDsokupJO6yRk2zW0dqKsJjfB4i612jNofVOpWPkIBe/NqCP2TsJwGuxGYSROETR8R3PyWlg4XdCA507w6/wm11Vmz4sfF8hHcykEjqOQPYSx7DoOoV9hGKNxAO9okZE9pHXLcJS4NTRuzSGx7vdug6jggBdZoG+ixSzwmqRdG7N9BPhQoWundAW5e4IWcOKPp6yVtMxk9KDeJz9yOyoIoGVFUxjPDCLOe0bOtstG6WCkpn1D7ADS50A/391og47dzXRqx4lTcimpsGreI8SlrcReKfSzGtbsB0Whwv7xwyMRSMFSxtg3PoQP3TsFxqgq3vEcv4hN/EAA4nsFeh0cmjgPkuBq9bl31KNFmPGkR5eJ4MOpRNXXp49srhmue2iqpeKsJxGMyNeGEstZg1+YCvzRQVIEU8LZYzoWuF1jeL+EcLwnLiNPnpryBpaD4TcHbstOl1CzxqVlUoqMuDnNiNI6CMwtu8XF2gkn5KpDa/IRTUxFyfE8Af1KMEQMkTGTSszDM3NpcK0p6aKN/4rjJ4rgne6vlkWPwXJJ+ShDcZbJZtIQ4blzg7+ivcAxbHcNrAJrvp3nVpNsvotDQYXQzWc6AG53ubqylwCjbG8xwkPba+vTusstSsqaUCUlDqTLPDuIxUMAc4Ejod1bQ1cFSBY2cOhWDqKCCOjnjjfeQtOTWxae4KqMI4ixinhtVMc9rHZWvcLZreaem1OoxpuErS8MyZNJGT9jPWzGC4PG/VB0TToR7yxcHG0cELXVAezUAi2YalTTx9hDQzmVAaXbXBF/0XYh+Rbjcotf3/AMMMseSLo0gjaG5cv1XO4jaQXXt3VIziqCqvyG6DqeqZJWmpN5JCG9hoFj1H5WP6xTbHHBkl3wiwqqvP4GHTqe6iZrFRDVMDrMPhGyRq2916LTpemnVWYJ8SaJmZIPUP2tvdAVTe6vIE4ORzqEKtndEVTe6YE0ORzKGKlvdP9ob3RQrKiR9hYrjnJKUurvRMVdk6H50s91z1OicAGhKxpBJsQmTVDIW5pHWGwHU+QUevxGnw2nM1S/K3YDqT2CpcJqn4tX+0vBsDYX2aPJZNVqfQhu8mjDg9V89GggdPVt8NoRf4jqPXss1jkkNLVuAe2V0mrydRe26m4/iP3c6q5dQWtNvCDve1xa/+3WIfib553zXNrFo16LmQeXP7pM6Sxwxqkc6ud5qnNvmY0bnp5Li+knzwSTxubBK4HMO106ljFTiETDcMLgXDy6rWY7TZKaITMEdgMrR0HTRap5PTaSXZlpyBhFWI6gG+WMdOqsK7EXOlMbHObceJ3Yf3Wfpayjo3F7jzCPdG1lHrsee9pyNa2/bVc94JTnaXA02l7jvXVskrnZsz2tNgb7D+64e2yctrXPsB0J2VJPWyvJu/fey6QUVTVRGZrCWXte63rAoxV8FUL3WuTR09UYWRhl3GTVxHQJVdd7ZTtiia5sIdcucdXKikqJGBtO1mUt0JO6v2SxUlHTSyZXNcLkEaAg7H6KucdqS75OtCe5V8E7hvCCXur6xhbSlpax2tnHysOi1Rx3DKdoaynlY64DQH6H5ON1Fwurq8efDNy3UjIhlAj8DS30Ct8d4ap8XoBGz8OePxRyHXXsfIrLm1em3elNJmb1WpFtg1fR1lI6o9wxjxMdoQ5U3EoZi7WRy5RG3Nlb2ssrQV+I4HUTYdVR5TcXJOo7EdwrvE8RooaOJ80wMkgy5QOw6rHlg4NRx9fROGTG8ndlVBQyRMGaQOazRgPQeSmwUAkeA0Ft+o6KJTTRS1IDHuEdrakW+S1GH0mVt2iwJusmfJKPD7NipckjDKCWlYxkuV7T1B1VlVmWCrgLYzynRFrnW6kjdNEslNT5vZuc0XtlKjwumrHh0zyG9IxsP7q1Z8enhufbMeS8j74GR4VFFO+oLB+ILAA3AVdBSQz1c9I5oDiC4N7jr+31V5jUwpcLE7WlxY5t2jpfRV+GEvrm10jcg5ZytcPeNwqZRvIm+EyeL2420VNbhNNDOKCr8Akbdr+4P7hT28IYbieGtpnyPfPFHZkuY5gb7rRy4VQ4rRhtbA2WxOV5uCD5EahZ6vqBw1UxwzSPLH35cm5t1BXYU8mHFGS5RWpLK9v8jOEVuDSNo6xl3xn8OYM0kb5nunVGPGW1rNA6ArW4xTsxfh6esijbzWMLgXDcAakfJeZuY4Fb9Np8WRrK48+DFqssk9q4+S3OLuGxQ++T3VMWOKY4PBXVOcXn3y7ugcbcPiVCS66aXOspBRf/fbx1SGPOHVZ4vcm53Jio0n3+4dUf8AkLx1WYL3BDmHumG09HewuOyXJ8lJI1skR2VVFtldW1lJhsPOq5mxNOgvuT5BQcOx2ixeokip87TGL2eAMw7jX/brLccVr6vFnQgWjpPB6k2JVZhhndTNmow+GZl2uma62izTyqL+jRDFa+zXcVVUf3a+mjiM78zTIGtvyxvc9tlTUGKOhyta0AW6aKfgcslC/JM4TxuJc8OGpNrX813x/BaOtojiGEvAeBd0Y0v3XOyyWok0+kbtPWJcme4oka6lEjjme+3i67rPRxu5IF8voutfO+WKOOS+j7aotcCA0ak6AK/FB48aQpyUptk7BqZ4fzepNhfqFqHTSSutlEk8pve17a9FS0L20rA6QgBoF1oeEv4/E3TyM/CZ4tr2AWLO5Tl9GvFHHGNlsMNpMOw3myxMqahzTmje3QX6XsvPMfw5sc/OY0Ma8m7G7A9l6Bita+abM0ktJ6nQBZbHI3zFsLAHOltky9SoafNLfS6I5MdxbZkHQAi1r26KTBjNVRU5pG5TEe7dR81zc/KCDuFwip5KmQvykhdfhr3dHN3OL9pOkrYXtDw3x21JPVW/D2FSYrMySpzGBhu1pOjlV0GFtlqg2TRjN/PyW6wwthtk0AGwXN1mZY4VDs0R3yVs12HsZDE1jWhoA6KzDtFSUs4c0a62VlBO0N8ey8ZljJyCqIHEWGUddSGR7hFUwjNE/wDNb4T3uql/AkmM4fC+oqTTSgFwbkFrnv8AotI1zK2oBbZzIz4Se6todhfou7o8k9qT8Etu1OvJ5zgXBr8GrXTYi7mStNowCSwDv5lbWmjbI2wNilj88TY2Ri1y64PUqNST2A1WPXSbzXJ2kXw/TguaRzIgI3NGQCxvqb/5XOoon0zucw/hk6gdFzkmbLDlbcPIsCFGh+8IZXQyVAa1xty3i7VoWzUYnFq0vPwVLHJStP8A0DGo5KrCpoodZHgZQDuQQf2UGhhqqVjWVLXMNvedbZH2x8VU6k5d3g2IJuLqbWVlPhlOXzPbpG5ztOwusmPpY5FqmlcUd5a90NRkE4kbYZcp0VZxXEccwNoiic+ppHcxuXUuGxH9D8lnMGxysqprTwksJOWSMZhZa3DKxmZzH08jY3+HmlpBB9PULdi9bHnpv2/0WShGCUkuUZ+THqx+FsozEYAIgwtIsSLaqidT3N7LaYlhclZHNOLA02mUbkHW6o6ej9sLuRZ4bvbovSaWcYYd83X+Tk6q55aSKMw6oci5OiuZ6RlO/LN+Gf5uq42pRvMz6rfGakrXKMTi06ZUup7nQWTXUt9LKzdNQsdrOy65urMPH/uap2xFYaUHomGj12VmKygLtJgniWjftMxO2JlMaO6aaQg7K/aymcf/ACs+qPs8B2kb9U7Dkz7+PcRcSWRsaFwfxxizho5rfks8XaLpRwioqWsc6zN3HsESaim2TjG+C1ipqvHJn1tU4NjccxOxcfL6K2ETIqLl8sQjNYAeq6RcqNkYDcotlaOwXOrntG9lgW9rrhZJvJK/B0YrYqO7GtFrEgkbhd5KRwycicxhwuDa4JI2KqoKl7pbHUbZrKypqrklzHgmN+u2x7rPOEo8xLYZKtMxuNU7hVSEsySNdZzexUfDCJK1jX3tbT1WjxrDo6yomqaeoJlIu6Nw07fXRZ2itT145oLNTcgXXQxzU8deSDVST8F++IvtDGBa3yV1wtmgqSwvyMERJF7ZjtZcsPdRNj5kjTI9wsAdALp2GyN+95OU+4Lstv6hYna4ZtrdK14J0wLHzOLgMnhBab73Wbr6tsFTSTZ8rYj4tL28Rv8ApZXtaJKeWWLYh2x/QrHY5UvcxrHaNFw3TfU6/qVXpIe8eWa2WmRYmx11Q2MyNiBuS92gC5z3pZMjJ2vbtdmxXXCIYjFJJMzOCco8lcQYTQVxaY2uafQm66M8sYSp9HPSTq3VlbQ174WtzC46O7rQ0OJGQsyWIJF1bu4Jjiw4VEzrstcN2CworW0ta8xXyB5y26C6yyjHPdLktleNLmz0iGvjgZnllDANydlHPErMRqTSUkhDAQHybE+QH7rCYjjM1SwMBOXr0RwNhkqW5XFp2uDqsa/HRjFzn2SWROdI9iwt2VgAFgALK7dM2npTJIQABclYbCa7EKB4ZMBUR/mGjgFdvxWkrQGOeRKw2MT7ADz81z8a9NvkvnFcWQMTqpqiRtWWkQZi1uYWPr810pqob5tFaVVOyrwyWN2jSy4cT16FYGLHA0ZI7vcNLBU44PURbS6HuS4NyysDdbgroKo10udrszhpnOwWG9srqiRv4ojZ2A2V5h88jWhrpXG5u4k6lQnpvTi+Q3qy0iw2eGudU80SXNyANU7igt+4ah+QSZgGg+pCsKMt5W2hVJxRFUVPDxkhzAxSGRzRfVovca/IqGjannW/wQi0nwZGhwV1PTx1kVU6GZpzN01uD/vRehYbUTVtjNGGx07c2ZzrNzWuXG19trLzSlxlsRfTZSXE6uv/ALorei4gqPu2CIkOM8pD3jdrQNAbeo18ivRR3JS9RDzPpp2ejQ4o4QOkDonlo0L2lt/LzUGimgie7JHGxrnF1miwudSoNFWEwhhN2kWsVawtp3xhskYv3GhXGz62eRqLdUUqKVujOOxAVE0tNUxMqIM5GWQba7gqmxngiWeE1+Cl5jOpp3OJI/8AyevzWsm4WYH82kmJH5XaqwoHOpIzC8jT9Fbh1c9NNNPh/wDhnjilO1I8OmgmhldHM17HsNnNcCCCudivaeIuF6TiKk8JbFVM1ZNbfyPkvJ8Xwatwap5FXFlJ91w1a4eRXr9JrMeoS+fgx5cLg/orbEJBzhs4j5p19EwgkrcUDjLKNnuv6p4nnt/5HfVci4hAFMKIMdnvALg1vUnorvDWQupuZHHbxWzO+IDr9f6KjlDGQRtvdzvE7y7BWlLUkUEDGixDTqOup0XM1Lk4UjdhST5LllVcnMTYWF1wlcHvaXu06KlNeY3HW2uoUyHFGPAGUXt1WFY5R5L3T6LGmAfly3Pi27hSjKw3a4ZTbdRKKo5Zjc8ADqB3XapDXPvG6zjqOxR2yHRJZkdERcHu4KjrcOY15e27wT0GoXYVDqeXUFo69QUyetv7uUdd9LKShK7Q1OuyK18sRLM5c23UqZh9VVYbUc6jaS4dTrlv10UF7ybPaQ4djuusNTeN7GOLb62O10Si65RfGcWqZdyY1BA38X+Inzh5zG19Njrt/hY+vqH1c1st3X6K7ipYMQibTzxDn3P47TZ1vPuoc+Cy4c9swvURHXOwG48j2TwuEOPJLJumuFwXnCGHsmmhop3RshkJ5rn/AArUmKn4VfnpsRgkINmxuGo8gV5wKqrb4oKeTtmsbLvRzSPqebVZnPboA4WVWTE3cmOUceSk10ehCeqxmDLPKYYyNI2aD/fJQv8Ai1JHGZIYYg7pcXJTsNrRJGyNguXaBvmtTRYZ4A6V2Yk6jsuO8mTe1dGl40ops8+xnhkS0hextpmjdo38lTcO07mVDHauvuOy9cOGEyvzi8R27lZWfA/ujHG1UbP4aZ2oto13+Vfi1U/Tljn/AKKnCO9SRZUcMhYHCJ5BFr5ShNhklTiMT/Z5eWW+N2UrSUbWNi8NwOilc9rWAddrLNHFH9nKirLLcqZQVTKqjwWalo4J5pXMdlzC2tvNec4c9sLjFIy0jdCCvW62r5UUk2T8OMkXBsSvJsTMc2KTTwm13lw1/da9PDHGLjF3ZWpX14J3PyPzdFb0FS0kbb6+SzDJ88d3OtbfyUmirsr3MzWt1vuo5cG6I07Z6JSVIDW6qxfK2aDQ2I6rAnHnNaIKeKSaXsxqvcHhxKtp2uqC6FxcDkyjb1v+y5EtHNPddGlRS7MZxPhQweslkp4XPpiMwIGjCdwfmm8OXmpXSSN0JuP7r1qXCoaqldE+FkjS0ggi91gcapaHh3FG4fC4tLm53Rn4ATpay7e/JPDtkufkrVN8Mt8PeHMB10V1BJfqsph9U0g5HgklXFNUPvsuDqMTtk1CzSwPtrfQKHPLzqsNb4nDoN9U+CT8Bzne60ZnKDI+mwHBK3iOpZ/EuuIQ6+rzoP8AewU9FpZ6hqDfBFtYk5PwWTZDAcr3WA3vpZeWcZ4+MaxIMhd/C012x2+I9Xf72VWeIcWdBLB7bM6KX3w51/1UAnTXdes/G/jHppuc3fwc3UZ1kSSA4Fo7phJCfa3kubnDqu8Yw5wN0MzD1QuDsmk6+6mBVlxOpNyntle1uVriB5LhdImyyunwXnR8lzckoCTtoo7iSUgSlSC2WVPiMsDtTmHYqczFWSgAv5bhtfZUGZHMq3hiyW9mjqKguN2yCRpChOkPw39FVtkc33XFvzTufL+cqKxV0G4nAyX0J+qOZ7dT9VX+0PHxEoOqZXCxOifptklKi4p8RfEb3ue/UK5w3GHiTxhridD5hYsSOB0cQpENY5h8V/UKjJpVJFsM7R6Uyvw1zXNEHs2moYcodtbQKwwf7uxTnRZ2iZhsxsx0d5gEf7Zed02KuLQHOzj9QrWmrY3yAg26XC5mTSV8muOds9Agwn2GcSy0rYnbB8erbenRX1PK57ASNCNHDYrB4bxHWUzuUJzNESRypNRZaTC8ejZUDPCeQ8eJhN7FcrNglGad8GrfvX2aTmNiizvkGmg8z5KPiVNHNE6CYvbm1GZvXofquGNQthoRiEEhkpwQbjUs9fJVWKcWYlT4fG+jw6esbewmbozbYnqrIwleyv8AHwZW3w0dJcV+74CycZXs8JBPVPw7EmzvkM2cA2tosxDiP3+znV7CJY3HPGPCQu1fjjYMOAw6nMko8Nst8nYlQljlu2Vb/wCFeZTlSS4G8W8QiAOoYZPEdTb91in1WUXuNU2rwvE5pJKmeQPe4lzteqivo3+zZ3klwNi0Houzp8GPHBJOyG2aXQXVRlkyMkyk7nor3hrDH1NawzHOL6XWZpGxioa0EkudbUL0PBJo4GAtsP3S1s3jx1HyTxK3bNXS0MLZ2xMsHnoAtHT0cMDA90gfp7rdFh28RRU85zMc58ZF9bafuran4liqIXOIMIPis/w2F7dd1ytLj2++cbZVlz+/ZZevreSZxlysY3N4V5tjGDz4zXy176V7pXnR46DotPLWyVTGsw5wq5Z5Gg5NA1vW9+q1mH4a6ma18xa0kasB0Hz+i14I5skr6LI5IQi32eQ0eG4hS1LWZZCL2sWm63eFYXX5G86lLO2Z1ifktJW41hWGRF1TUMjazpbf07n0WF4h+0CaqbJBhTTFG8W5ztH79O3z7rTk/HRzfsweraXRr+RRUkLn19VHFCR4gXW2815rx7xOOIZYKOjYY6CmJyg7yO2uR002VMZaifSaeWSxJGd5dvvumSw+G/bqt+j0uPTKoox5csplW5mULmSMwXaUWcbLiSNyNl1UZhrzYaXITC6++icQbb/VN3UhDcxHmln7hA3BSsT0v80DKe6CSSysuGlJEhKyAAkjZKyLACSVkkABJFJMBJJJIAIJGo0XaOqmYbh/1XBFJpPsdtFtS49UU52DgtZg/E1NUWY6QMf2doV5+E4Gyx5tJjyqmqLseecGe74DjxprscRLA/3mHUWW2pjS1NMHU4YYHC2QAWC+Z8M4grcNcOXJnYPhcbrd8PfaOynlbzZDDe2ZrtiufHBl00qrdH+0aJThmVp0z1Ss4cwusfzn0jGybF7BlJ+m6zuKcM02FwVFThsbWumtzGvJIcBtYdDqVpcHxyixukbNRzMefiaHglqqeKIZ4mPrmhxY1uUxWv8ANS1aisTljXYsDk8ijJnleIOIqZi5kjy9p8PUeSoGsfG3PIDy72JG+yv62oOJVxmc1rRta+9lVSzGF0jJSx0dsoaXbX6j6KOBtRrydDLi8oqJJWxzh0J0BuCRZXeHY602jlGUjaypJm535zt9EIqSaqlayJpc8mwyrbPHCcfcYKlGXBoMXnZM1skL5DIBclpNrBXeCcO1nFdAXijq3yNZlFRNMGRNPTKLXOgVhgXDFJg9I3FeJ63LTs15LzcOPbL19EzH/tQrJs1LgMTaKmAyiQtGc+Y6BR00bjUevkpy0pXJKzRHFcB+zjDYqN5FXiLh4mxgF48yeg8lVS/aeasOEVAXvt4ebJZo+Q3XmksklRO6aaR8kjzmc95uSfVT8PjzStvoFq9KMYlG7ktsSra7F6v2mslzu2Y1os1g7AdE6npswt+ikCjaWNym3qbqRFSlo0f9VFyI0RTSiM6AarlUREM921lYyQnqVFqhZpAI+ZRGQ2jPVDbO/wAKG5uug3UyrNnG5N1Be519HEELdB8FQiCNCmnyTXOe43c4k33J1TC53qrLInUsIAO4OxXMjKbHT9U0v2uldp6pgWGIcEYtSYAMdliiiY8CZ9I134kMTnWa8tOuUnTv3WbWu4i4pxmt4ZwuinrXuhqInvnA3mdzXe8eoFhpt5LIgXWZloEkbaogKIwBObG998jC629hdBb/AOxmqkj44bSjKYaqB4ka4XvYZh+oQB58Ra6Lo5GtzOY4A9SNFseL8Go4ftXqMMjYW001bFmaDtzMpcB21cbLQfbjVSQYjheDwhkdHFT80Rsba7r5bn0A09SmB5WkikUABJJJMBIgoJJAOCN01K6QDwU8Fc09qALLCsYrsHq21NDUvhkb1B0PkQvT8C+1tk8LYMWY1r9nOt4Xf2XkIKIOqoy4YzV9E4zcT304XwjxICaUU+aQXzQSgOB9Fl8f4R4ZwlpfV1tXT5vd8Adr6heXRyPY+7HlpHUGydJNLM+8sr3nu43VK0nlM0R1Ukvouq44RJLFTUkrpGtvmkdpf6q8wjHcBwCiMzI/aqu3hiy217l1tB6LEN3K6DspvRxkkpNtIU9ZJrhUWuKY3XY9XGqrZC4n3WDRrB2AXE2DVHjCc8kFalFLhGRtvlnQeRUmnlLXi1vqoIOl12jJBGp3TYjSUtQ9zRmDb+qnxy6e68H1VBSSPDRqrCOR2nc6Xus8ojTLB85PxuChVUji2+cEW2PRdJLi2pt2VdXOLXWCIxQytqjckk/RQ33OtzddZnlztbarg4aLbHorYL9z+iaTbrYXQcbIWvqpoQXPLySdT1TESLC6BCYH/9k=	\N
111	TOSTADAS CAMARON	TOSTADAS DE CAMARON	19	82	\N		1	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	\N
\.


--
-- Data for Name: promociones; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.promociones (id, nombre, descripcion, inicia, termina, precio, dias, productos, productoscodificado) FROM stdin;
\.


--
-- Data for Name: roles; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.roles (rol, descripcion, id) FROM stdin;
Administrador	Administrador del sistema en general	1
Barman	El que atiende en barra	3
Cajera	Cajera lobster	7
Cocina	Cocina de lobster	6
Mesero	Mesero que atiende en la mesa	2
\.


--
-- Data for Name: subcategoria; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.subcategoria (nombre, submenu_enlazado, id, id_categoria, id_subcategoria) FROM stdin;
CHICO	\N	75	85	1
MEDIANO	\N	76	85	2
GRANDE	\N	77	85	3
MOJARRAS	\N	78	90	1
HUACHINANGOS	\N	79	90	2
SALMONES	\N	80	90	3
MEDIA	\N	81	96	1
PREMIUM	\N	82	96	2
HINEKEN	\N	83	96	3
MEDIA	\N	84	97	1
PREMIUM	\N	85	97	2
HEINEKEN	\N	86	97	3
SABORES	84	87	97	1
MARISCOS	84	88	97	1
SABORES	85	89	97	2
MARISCOS	85	90	97	2
SABORES	86	91	97	3
MARISCOS	86	92	97	3
MEDIA	\N	93	98	1
PREMIUM	\N	94	98	2
HEINEKEN	\N	95	98	3
SOLA	93	96	98	1
SABORES	93	97	98	1
MARISCOS	93	98	98	1
SOLA	94	99	98	2
SABORES	94	100	98	2
MARISCOS	94	101	98	2
SOLA	95	102	98	3
SABORES	95	103	98	3
MARISCOS	95	104	98	3
MEDIA	\N	105	99	1
PREMIUM	\N	106	99	2
HEINEKEN	\N	107	99	3
MEDIA	\N	108	104	1
PREMIUM	\N	109	104	2
NORMAL	108	110	104	1
MARISCOS	108	111	104	1
NORMAL	109	112	104	2
NATURAL	\N	113	105	1
MEDIA	\N	114	105	2
PREMIUM	\N	115	105	3
HEINEKEN	\N	116	105	4
 NORMAL	113	117	105	1
MARSICOS	113	118	105	1
NORMAL	114	119	105	2
MARSICOS	114	120	105	2
NORMAL	115	121	105	3
MARISCOS 	115	122	105	3
NORMAL	116	123	105	4
MARISCOS	116	124	105	4
GLOBO	\N	125	106	1
JARRA	\N	126	106	2
VASO	\N	127	107	1
GLOBO	\N	128	107	2
MEDIA JARRA	\N	129	107	3
JARRA	\N	130	107	4
VASO	\N	131	108	1
GLOBO	\N	132	108	2
MEDIA JARRA	\N	133	108	3
JARRA	\N	134	108	4
\.


--
-- Data for Name: sucursales; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.sucursales (direccion, nombre, id) FROM stdin;
XOXO	XOXO	3
\.


--
-- Data for Name: tickets; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.tickets (id_ticket, id_user, fecha, id_folio, id_sucursal, hora, id_mesa, nombre, cortesia, efectivo_porcentaje) FROM stdin;
440	23	2019-08-27	93	3	\N	14	Mesa 14	\N	\N
441	23	2019-08-27	94	3	\N	2	Mesa 2	\N	\N
442	23	2019-08-27	95	3	\N	19	Mesa 19	\N	\N
443	23	2019-08-27	96	3	\N	3	Mesa 3	\N	\N
444	23	2019-08-27	97	3	\N	17	Mesa 17	\N	\N
\.


--
-- Data for Name: tipo_producto; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.tipo_producto (nombre, descripcion, id_tipoproducto) FROM stdin;
CIUDAD alterna	\N	4
oaxaca alterna	\N	5
veracruz	av obesa 1 norte	3
\.


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.users (login, nombre, id_rol, password, id_sucursal, menu, catalogos, bar, cocina, cuentas, transacciones, id, inicio, gestion_usuarios, sucursales, mesas, caja, productos, historial_cuentas, reportes, autorizar, inventario, configuraciones, iniciar_en) FROM stdin;
Admin	Mariscal	3	12345	3	t	t	t	t	t	t	1	t	t	t	t	t	t	t	t	t	t	t	1
Alicia	Alicia Navarro	1	1210	3	t	t	t	t	t	t	16	t	t	t	t	t	t	t	t	t	t	t	8
Asael	Asael	2	0226	3	t	t	f	t	t	f	29	t	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1
Cocinero	Cocinero	6	12345	3	f	f	f	t	f	f	26	t	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1
Miriam	Mriam cruz	7	3120	3	f	f	f	f	f	f	27	\N	\N	\N	\N	t	\N	\N	\N	\N	\N	\N	5
Nahum	Nahum Jarquín	2	mimi	3	t	f	f	t	t	f	28	t	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0
Mesero1	Nsjsjs	2	12345	3	t	f	f	t	t	f	23	t	\N	\N	\N	t	\N	\N	\N	\N	\N	\N	1
\.


--
-- Name: carrito_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.carrito_id_seq', 7, true);


--
-- Name: categoria_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.categoria_id_seq', 108, true);


--
-- Name: categoria_insumos_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.categoria_insumos_id_seq', 1, false);


--
-- Name: combos_id_combo_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.combos_id_combo_seq', 23, true);


--
-- Name: control_movimientos_id_control_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.control_movimientos_id_control_seq', 10, true);


--
-- Name: correos_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.correos_id_seq', 1, false);


--
-- Name: detalle_ticket_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.detalle_ticket_id_seq', 788, true);


--
-- Name: gastos_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.gastos_id_seq', 11, true);


--
-- Name: historico_corte_especial_serial_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.historico_corte_especial_serial_seq', 1, false);


--
-- Name: insumos_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.insumos_id_seq', 60, true);


--
-- Name: inventario_id_inventario_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.inventario_id_inventario_seq', 8, true);


--
-- Name: key_serial_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.key_serial_seq', 1, true);


--
-- Name: productos_id_producto_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.productos_id_producto_seq', 436, true);


--
-- Name: promociones_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.promociones_id_seq', 21, true);


--
-- Name: roles_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.roles_id_seq', 5, true);


--
-- Name: subcategoria_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.subcategoria_id_seq', 134, true);


--
-- Name: tickets_id_ticket_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.tickets_id_ticket_seq', 444, true);


--
-- Name: tipo_producto_id_tipoproducto_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.tipo_producto_id_tipoproducto_seq', 5, true);


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.users_id_seq', 8, true);


--
-- Name: categoria categoria_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.categoria
    ADD CONSTRAINT categoria_pkey PRIMARY KEY (id);


--
-- Name: historico_promocion_productos historico_promocion_productos_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.historico_promocion_productos
    ADD CONSTRAINT historico_promocion_productos_pkey PRIMARY KEY (id_ticket, id_promocion, id_producto);


--
-- Name: historico_promocion_ticket historico_promocion_ticket_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.historico_promocion_ticket
    ADD CONSTRAINT historico_promocion_ticket_pkey PRIMARY KEY (id_ticket, id_promocion);


--
-- Name: mesas mesas_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.mesas
    ADD CONSTRAINT mesas_pkey PRIMARY KEY (id_mesa, id_sucursal);


--
-- Name: roles roles_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.roles
    ADD CONSTRAINT roles_pkey PRIMARY KEY (rol);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (login);


--
-- Name: SCHEMA public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE ALL ON SCHEMA public FROM postgres;


--
-- PostgreSQL database dump complete
--

