PGDMP  '                
    |            kozou    16.4    16.4     �           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false                        0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false                       0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false                       1262    16437    kozou    DATABASE     x   CREATE DATABASE kozou WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'Japanese_Japan.932';
    DROP DATABASE kozou;
                postgres    false            �            1259    16616    category_table    TABLE     o   CREATE TABLE public.category_table (
    categorynumber integer NOT NULL,
    numberofregistrations integer
);
 "   DROP TABLE public.category_table;
       public         heap    postgres    false            �            1259    16619    product_table    TABLE     �   CREATE TABLE public.product_table (
    productnumber character varying(10) NOT NULL,
    productname character varying(20) NOT NULL,
    categorynumber character varying(5) NOT NULL,
    numberofregistrations integer
);
 !   DROP TABLE public.product_table;
       public         heap    postgres    false            �            1259    16622    stock_table    TABLE       CREATE TABLE public.stock_table (
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
       public         heap    postgres    false            �            1259    16615    stock_table_id_seq    SEQUENCE     �   CREATE SEQUENCE public.stock_table_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 )   DROP SEQUENCE public.stock_table_id_seq;
       public          postgres    false    218                       0    0    stock_table_id_seq    SEQUENCE OWNED BY     I   ALTER SEQUENCE public.stock_table_id_seq OWNED BY public.stock_table.id;
          public          postgres    false    215            �            1259    16627 
   user_table    TABLE       CREATE TABLE public.user_table (
    nickname character varying(10) NOT NULL,
    password text NOT NULL,
    prefectures character varying(4) NOT NULL,
    sex character varying(10) NOT NULL,
    emailaddress text NOT NULL,
    dateofbirth character varying(10) NOT NULL
);
    DROP TABLE public.user_table;
       public         heap    postgres    false            \           2604    16632    stock_table id    DEFAULT     p   ALTER TABLE ONLY public.stock_table ALTER COLUMN id SET DEFAULT nextval('public.stock_table_id_seq'::regclass);
 =   ALTER TABLE public.stock_table ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    218    215    218            �          0    16616    category_table 
   TABLE DATA           O   COPY public.category_table (categorynumber, numberofregistrations) FROM stdin;
    public          postgres    false    216          �          0    16619    product_table 
   TABLE DATA           j   COPY public.product_table (productnumber, productname, categorynumber, numberofregistrations) FROM stdin;
    public          postgres    false    217   E       �          0    16622    stock_table 
   TABLE DATA           �   COPY public.stock_table (id, emailaddress, productnumber, stock, startusing, enduse, perioddenominator, periodnumerator, activenumber) FROM stdin;
    public          postgres    false    218   �       �          0    16627 
   user_table 
   TABLE DATA           e   COPY public.user_table (nickname, password, prefectures, sex, emailaddress, dateofbirth) FROM stdin;
    public          postgres    false    219   '                  0    0    stock_table_id_seq    SEQUENCE SET     @   SELECT pg_catalog.setval('public.stock_table_id_seq', 5, true);
          public          postgres    false    215            ^           2606    16634 "   category_table category_table_pkey 
   CONSTRAINT     l   ALTER TABLE ONLY public.category_table
    ADD CONSTRAINT category_table_pkey PRIMARY KEY (categorynumber);
 L   ALTER TABLE ONLY public.category_table DROP CONSTRAINT category_table_pkey;
       public            postgres    false    216            d           2606    16636    user_table nickname 
   CONSTRAINT     R   ALTER TABLE ONLY public.user_table
    ADD CONSTRAINT nickname UNIQUE (nickname);
 =   ALTER TABLE ONLY public.user_table DROP CONSTRAINT nickname;
       public            postgres    false    219            f           2606    16638    user_table password 
   CONSTRAINT     R   ALTER TABLE ONLY public.user_table
    ADD CONSTRAINT password UNIQUE (password);
 =   ALTER TABLE ONLY public.user_table DROP CONSTRAINT password;
       public            postgres    false    219            `           2606    16640     product_table product_table_pkey 
   CONSTRAINT     i   ALTER TABLE ONLY public.product_table
    ADD CONSTRAINT product_table_pkey PRIMARY KEY (productnumber);
 J   ALTER TABLE ONLY public.product_table DROP CONSTRAINT product_table_pkey;
       public            postgres    false    217            b           2606    16642    stock_table stock_table_pkey 
   CONSTRAINT     Z   ALTER TABLE ONLY public.stock_table
    ADD CONSTRAINT stock_table_pkey PRIMARY KEY (id);
 F   ALTER TABLE ONLY public.stock_table DROP CONSTRAINT stock_table_pkey;
       public            postgres    false    218            h           2606    16644    user_table user_table_pkey 
   CONSTRAINT     b   ALTER TABLE ONLY public.user_table
    ADD CONSTRAINT user_table_pkey PRIMARY KEY (emailaddress);
 D   ALTER TABLE ONLY public.user_table DROP CONSTRAINT user_table_pkey;
       public            postgres    false    219            �      x�3�46�2�42�2�44������ ��      �   V  x����N�0Fg�I` %N�H"ԉށ�"(a` Q$�
�*	*a�a����W���͏�����l��9k�C�}"< �z���2�����C�ΎH�6��mWI��\������)�����j.m�M90��x8�o^��!<!�z2�֒��KY�[˪\C\j��>�O"���k����R���M� ��R���1�Gd}�~v���U^�}6џ �ZE������Q��7�K�i)���f�іpz�
v�&ъU��k�*�o�kef�FQ��~�;��7;*n\��\	�&X_�n�o�q2���~%��ূ�	�<����bɇ�Y�,�Gb4      �   l   x�3��H�K��wH�O�����K��*�t��5�50�4��C C.#|ʍ0��Sn��܄�$�(�!��<5	�6���%F\���y�鹉�9���Q�X`����� &�<      �   a  x�=ϱ�A��]v�����AL���u�ݙ�89�H�DLL.14PDX�m�\}�����~�?��׻�������*E��U��TC�TIH=�B&C�P3�T�D���xO	�������Ͽo?8�.�ݖ��b�q���^�Z�����Ü����\	"%����dO��s[��*�d*�1����I�'u�_���9�q���3�8��i��h뗇'W�K��\bطb[J؊�-#?3A��[eH�B�"쵑��͝����v����etc���>���~�iNwƭSS!˭�E�D-X1'5���:Q��Y��S,-��d�X0�uOǏ��et�|����[X�=[w]� �뗭     