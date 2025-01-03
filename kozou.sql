PGDMP  6    7            
    |            kozou    16.4    16.4     �           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            �           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            �           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false                        1262    16414    kozou    DATABASE     x   CREATE DATABASE kozou WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'Japanese_Japan.932';
    DROP DATABASE kozou;
                postgres    false            �            1259    16712    category_table    TABLE     t   CREATE TABLE public.category_table (
    categorynumber integer NOT NULL,
    categoryname character varying(10)
);
 "   DROP TABLE public.category_table;
       public         heap    postgres    false            �            1259    16715    product_table    TABLE     �   CREATE TABLE public.product_table (
    productnumber character varying(10) NOT NULL,
    productname character varying(20) NOT NULL,
    categorynumber integer NOT NULL,
    perioddenominator integer
);
 !   DROP TABLE public.product_table;
       public         heap    postgres    false            �            1259    16718    stock_table    TABLE       CREATE TABLE public.stock_table (
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
       public         heap    postgres    false            �            1259    16723    stock_table_id_seq    SEQUENCE     �   CREATE SEQUENCE public.stock_table_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 )   DROP SEQUENCE public.stock_table_id_seq;
       public          postgres    false    217                       0    0    stock_table_id_seq    SEQUENCE OWNED BY     I   ALTER SEQUENCE public.stock_table_id_seq OWNED BY public.stock_table.id;
          public          postgres    false    218            �            1259    16724 
   user_table    TABLE       CREATE TABLE public.user_table (
    nickname character varying(10) NOT NULL,
    password text NOT NULL,
    prefectures character varying(4) NOT NULL,
    sex character varying(10) NOT NULL,
    emailaddress text NOT NULL,
    dateofbirth character varying(10) NOT NULL
);
    DROP TABLE public.user_table;
       public         heap    postgres    false            \           2604    16729    stock_table id    DEFAULT     p   ALTER TABLE ONLY public.stock_table ALTER COLUMN id SET DEFAULT nextval('public.stock_table_id_seq'::regclass);
 =   ALTER TABLE public.stock_table ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    218    217            �          0    16712    category_table 
   TABLE DATA           F   COPY public.category_table (categorynumber, categoryname) FROM stdin;
    public          postgres    false    215   �       �          0    16715    product_table 
   TABLE DATA           f   COPY public.product_table (productnumber, productname, categorynumber, perioddenominator) FROM stdin;
    public          postgres    false    216          �          0    16718    stock_table 
   TABLE DATA           �   COPY public.stock_table (id, emailaddress, productnumber, stock, startusing, enduse, perioddenominator, periodnumerator, activenumber) FROM stdin;
    public          postgres    false    217   d       �          0    16724 
   user_table 
   TABLE DATA           e   COPY public.user_table (nickname, password, prefectures, sex, emailaddress, dateofbirth) FROM stdin;
    public          postgres    false    219   �                  0    0    stock_table_id_seq    SEQUENCE SET     A   SELECT pg_catalog.setval('public.stock_table_id_seq', 31, true);
          public          postgres    false    218            ^           2606    16731 "   category_table category_table_pkey 
   CONSTRAINT     l   ALTER TABLE ONLY public.category_table
    ADD CONSTRAINT category_table_pkey PRIMARY KEY (categorynumber);
 L   ALTER TABLE ONLY public.category_table DROP CONSTRAINT category_table_pkey;
       public            postgres    false    215            d           2606    16733    user_table nickname 
   CONSTRAINT     R   ALTER TABLE ONLY public.user_table
    ADD CONSTRAINT nickname UNIQUE (nickname);
 =   ALTER TABLE ONLY public.user_table DROP CONSTRAINT nickname;
       public            postgres    false    219            `           2606    16737     product_table product_table_pkey 
   CONSTRAINT     i   ALTER TABLE ONLY public.product_table
    ADD CONSTRAINT product_table_pkey PRIMARY KEY (productnumber);
 J   ALTER TABLE ONLY public.product_table DROP CONSTRAINT product_table_pkey;
       public            postgres    false    216            b           2606    16739    stock_table stock_table_pkey 
   CONSTRAINT     Z   ALTER TABLE ONLY public.stock_table
    ADD CONSTRAINT stock_table_pkey PRIMARY KEY (id);
 F   ALTER TABLE ONLY public.stock_table DROP CONSTRAINT stock_table_pkey;
       public            postgres    false    217            f           2606    16741    user_table user_table_pkey 
   CONSTRAINT     b   ALTER TABLE ONLY public.user_table
    ADD CONSTRAINT user_table_pkey PRIMARY KEY (emailaddress);
 D   ALTER TABLE ONLY public.user_table DROP CONSTRAINT user_table_pkey;
       public            postgres    false    219            �   4   x�3�|ܴ�q���͛7Oܼ�ˈ�q�*�i'�1����_������� -p�      �   @  x����J�@��ɓ�B��Dp߅ nn�G�w0s7ڍ���*�V�PA�sI�oa�zs�dF��}��s����!����g��q?M����������޶�{��`�1c��ԝ�^�׊�=<`��E
Iv$�������hf�|A(N�=�m������%C�t���=����7_�-.י�,�x#K��eP��5�`� ��>Es�f�0̏(̲tR��y�%�V�fi%�W![cj��H��(�2�Ѭ�S���W[�v�ZT��|h
�����&%p+ltRB�Қ�i��� [�7�A�=�.���Ѧ���n�H�      �   G  x�}�AO�0���ie;I��v�	���ڥ@���:!$$~=v��l͸����޳�������k�����U�'x�Yߙ	ٖD%6����<PA.˭���(#��٫\��ȡ��[(��s�>=J43p�K~����4��A���iw�/���V�5S�W�U菱S�"��/r��h|�k�L�:��5�ٳ1�4&�+���|��4M�I3�Ŧ�v悛����ңj�ĆxH'M�6��������w��\Z�7A#$-�<�R���d;�VÌ���m�L�it�x��:#�%�NZ���d��3Ӛ�Mʸ��sSE����      �   �  x�����A��w٥���bR�U����,ˉh�F��hp��*",����޽�=��¯���W_�]���{�^���H�G.�b�՘��0�vي�@E�����ǻ_�^�W2l/^�5���q\�e3=�e�Z녆��	���T6������)%�A'AĶ͌���������> �TD;V��������.U�7�N�+�pZ��|�=s����w�Bg!zc�$.d�EM�H����u,����s����U�:~yw��z��eΥ+y�\�49ǅN-ݶ׊�K�P+Y[�-��'��Eͅ�+Ul	��\m�9��هH3��0O��[W��7'93�p��������ׇ77g���4Ͽ<mZ�Gˮ�� ��c     