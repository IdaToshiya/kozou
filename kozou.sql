PGDMP  ;                
    |            kozou    16.4    16.4     �           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false                        0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false                       0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false                       1262    16442    kozou    DATABASE     x   CREATE DATABASE kozou WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'Japanese_Japan.932';
    DROP DATABASE kozou;
                postgres    false            �            1259    16864    category_table    TABLE     o   CREATE TABLE public.category_table (
    categorynumber integer NOT NULL,
    numberofregistrations integer
);
 "   DROP TABLE public.category_table;
       public         heap    postgres    false            �            1259    16867    product_table    TABLE     �   CREATE TABLE public.product_table (
    productnumber character varying(10) NOT NULL,
    productname character varying(20) NOT NULL,
    categorynumber character varying(5) NOT NULL,
    numberofregistrations integer
);
 !   DROP TABLE public.product_table;
       public         heap    postgres    false            �            1259    16870    stock_table    TABLE       CREATE TABLE public.stock_table (
    id integer NOT NULL,
    emailaddress text,
    productnumber character varying(10),
    stock integer,
    startusing date,
    enduse date,
    perioddenominator integer,
    periodnumerator integer,
    activenumber integer
);
    DROP TABLE public.stock_table;
       public         heap    postgres    false            �            1259    16875    stock_table_id_seq    SEQUENCE     �   CREATE SEQUENCE public.stock_table_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 )   DROP SEQUENCE public.stock_table_id_seq;
       public          postgres    false    217                       0    0    stock_table_id_seq    SEQUENCE OWNED BY     I   ALTER SEQUENCE public.stock_table_id_seq OWNED BY public.stock_table.id;
          public          postgres    false    218            �            1259    16876 
   user_table    TABLE       CREATE TABLE public.user_table (
    nickname character varying(10) NOT NULL,
    password text NOT NULL,
    prefectures character varying(4) NOT NULL,
    sex character varying(10) NOT NULL,
    emailaddress text NOT NULL,
    dateofbirth character varying(10) NOT NULL
);
    DROP TABLE public.user_table;
       public         heap    postgres    false            \           2604    16881    stock_table id    DEFAULT     p   ALTER TABLE ONLY public.stock_table ALTER COLUMN id SET DEFAULT nextval('public.stock_table_id_seq'::regclass);
 =   ALTER TABLE public.stock_table ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    218    217            �          0    16864    category_table 
   TABLE DATA           O   COPY public.category_table (categorynumber, numberofregistrations) FROM stdin;
    public          postgres    false    215          �          0    16867    product_table 
   TABLE DATA           j   COPY public.product_table (productnumber, productname, categorynumber, numberofregistrations) FROM stdin;
    public          postgres    false    216   =       �          0    16870    stock_table 
   TABLE DATA           �   COPY public.stock_table (id, emailaddress, productnumber, stock, startusing, enduse, perioddenominator, periodnumerator, activenumber) FROM stdin;
    public          postgres    false    217   v       �          0    16876 
   user_table 
   TABLE DATA           e   COPY public.user_table (nickname, password, prefectures, sex, emailaddress, dateofbirth) FROM stdin;
    public          postgres    false    219   �                  0    0    stock_table_id_seq    SEQUENCE SET     @   SELECT pg_catalog.setval('public.stock_table_id_seq', 5, true);
          public          postgres    false    218            ^           2606    16883 "   category_table category_table_pkey 
   CONSTRAINT     l   ALTER TABLE ONLY public.category_table
    ADD CONSTRAINT category_table_pkey PRIMARY KEY (categorynumber);
 L   ALTER TABLE ONLY public.category_table DROP CONSTRAINT category_table_pkey;
       public            postgres    false    215            d           2606    16885    user_table nickname 
   CONSTRAINT     R   ALTER TABLE ONLY public.user_table
    ADD CONSTRAINT nickname UNIQUE (nickname);
 =   ALTER TABLE ONLY public.user_table DROP CONSTRAINT nickname;
       public            postgres    false    219            f           2606    16887    user_table password 
   CONSTRAINT     R   ALTER TABLE ONLY public.user_table
    ADD CONSTRAINT password UNIQUE (password);
 =   ALTER TABLE ONLY public.user_table DROP CONSTRAINT password;
       public            postgres    false    219            `           2606    16889     product_table product_table_pkey 
   CONSTRAINT     i   ALTER TABLE ONLY public.product_table
    ADD CONSTRAINT product_table_pkey PRIMARY KEY (productnumber);
 J   ALTER TABLE ONLY public.product_table DROP CONSTRAINT product_table_pkey;
       public            postgres    false    216            b           2606    16891    stock_table stock_table_pkey 
   CONSTRAINT     Z   ALTER TABLE ONLY public.stock_table
    ADD CONSTRAINT stock_table_pkey PRIMARY KEY (id);
 F   ALTER TABLE ONLY public.stock_table DROP CONSTRAINT stock_table_pkey;
       public            postgres    false    217            h           2606    16893    user_table user_table_pkey 
   CONSTRAINT     b   ALTER TABLE ONLY public.user_table
    ADD CONSTRAINT user_table_pkey PRIMARY KEY (emailaddress);
 D   ALTER TABLE ONLY public.user_table DROP CONSTRAINT user_table_pkey;
       public            postgres    false    219            �      x�3�46�2�42�2�44������ ��      �   )  x���1N�0���$0�;�����p��.]Eb@*�P��R���yJ��ډ�Ʊ����g?g{�G�V�;�4}��AIE�F�'A��L�����M�nr�{<��7_�ϗ�������w�@�/�ɢ�=C��@�}3�R�d.u-�r�����e޸�m��	�Q���C0�%�+WR!��FI���=�4��*ޡ����s�0am�zP��m�~G���k�_�)����d�j��c�pf�殛�j8q�F�N]�U�Tv�2������� �rT�T��s%������B      �   y   x�3�,���vH�M�����
5�50�4��C c.CΌļ��|������|��T��N�`_�rCN�\FX����)7ƪ<�ܘ�]�	gIbQ�CjUyj��F ��Q�q��qqq ��<a      �   `  x�=нjA�z�]$f��wz�4�o���]al�]9M*�&�I�&e���m�(y���p�������ݧ�~o$*I���(�#
���oΥ���Q*6T���% ���/~������vwvi�8���ê��x.K���S�8�z4�E �KP i"�R�&[�k�"(�J-6:V�bB���1��w��_oL�-nԼ�d��q9��d��ƅ�ݮ�FT�hj��g��F�)��z����n�9��k�-פ>֘2�������7����-�������t4<��<qB&!���I"��4��6;k���MJ�������o�\�ҫ���\�ya˔�ݲ�g����     