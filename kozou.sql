PGDMP  
                
    |            kozou    16.4    16.4     �           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            �           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            �           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            �           1262    16442    kozou    DATABASE     x   CREATE DATABASE kozou WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'Japanese_Japan.932';
    DROP DATABASE kozou;
                postgres    false            �            1259    16664    category_table    TABLE     o   CREATE TABLE public.category_table (
    categorynumber integer NOT NULL,
    numberofregistrations integer
);
 "   DROP TABLE public.category_table;
       public         heap    postgres    false            �            1259    16667    product_table    TABLE     �   CREATE TABLE public.product_table (
    productnumber character varying(10) NOT NULL,
    productname character varying(20) NOT NULL,
    categorynumber integer NOT NULL,
    numberofregistrations integer
);
 !   DROP TABLE public.product_table;
       public         heap    postgres    false            �            1259    16670    stock_table    TABLE       CREATE TABLE public.stock_table (
    emailaddress text NOT NULL,
    productnumber character varying(10) NOT NULL,
    stock integer NOT NULL,
    startusing date,
    enduse date,
    perioddenominator integer,
    periodnumerator integer,
    activenumber integer NOT NULL
);
    DROP TABLE public.stock_table;
       public         heap    postgres    false            �            1259    16675 
   user_table    TABLE       CREATE TABLE public.user_table (
    nickname character varying(10) NOT NULL,
    password text NOT NULL,
    prefectures character varying(4) NOT NULL,
    sex character varying(10) NOT NULL,
    emailaddress text NOT NULL,
    dateofbirth character varying(10) NOT NULL
);
    DROP TABLE public.user_table;
       public         heap    postgres    false            �          0    16664    category_table 
   TABLE DATA           O   COPY public.category_table (categorynumber, numberofregistrations) FROM stdin;
    public          postgres    false    215   �       �          0    16667    product_table 
   TABLE DATA           j   COPY public.product_table (productnumber, productname, categorynumber, numberofregistrations) FROM stdin;
    public          postgres    false    216   �       �          0    16670    stock_table 
   TABLE DATA           �   COPY public.stock_table (emailaddress, productnumber, stock, startusing, enduse, perioddenominator, periodnumerator, activenumber) FROM stdin;
    public          postgres    false    217   C       �          0    16675 
   user_table 
   TABLE DATA           e   COPY public.user_table (nickname, password, prefectures, sex, emailaddress, dateofbirth) FROM stdin;
    public          postgres    false    218   �       \           2606    16681 "   category_table category_table_pkey 
   CONSTRAINT     l   ALTER TABLE ONLY public.category_table
    ADD CONSTRAINT category_table_pkey PRIMARY KEY (categorynumber);
 L   ALTER TABLE ONLY public.category_table DROP CONSTRAINT category_table_pkey;
       public            postgres    false    215            b           2606    16683    user_table nickname 
   CONSTRAINT     R   ALTER TABLE ONLY public.user_table
    ADD CONSTRAINT nickname UNIQUE (nickname);
 =   ALTER TABLE ONLY public.user_table DROP CONSTRAINT nickname;
       public            postgres    false    218            d           2606    16685    user_table password 
   CONSTRAINT     R   ALTER TABLE ONLY public.user_table
    ADD CONSTRAINT password UNIQUE (password);
 =   ALTER TABLE ONLY public.user_table DROP CONSTRAINT password;
       public            postgres    false    218            ^           2606    16687     product_table product_table_pkey 
   CONSTRAINT     i   ALTER TABLE ONLY public.product_table
    ADD CONSTRAINT product_table_pkey PRIMARY KEY (productnumber);
 J   ALTER TABLE ONLY public.product_table DROP CONSTRAINT product_table_pkey;
       public            postgres    false    216            `           2606    16689    stock_table stock_table_pkey 
   CONSTRAINT     d   ALTER TABLE ONLY public.stock_table
    ADD CONSTRAINT stock_table_pkey PRIMARY KEY (emailaddress);
 F   ALTER TABLE ONLY public.stock_table DROP CONSTRAINT stock_table_pkey;
       public            postgres    false    217            f           2606    16691    user_table user_table_pkey 
   CONSTRAINT     b   ALTER TABLE ONLY public.user_table
    ADD CONSTRAINT user_table_pkey PRIMARY KEY (emailaddress);
 D   ALTER TABLE ONLY public.user_table DROP CONSTRAINT user_table_pkey;
       public            postgres    false    218            �      x�3�46�2�42�2�44������ ��      �   9  x���OJ�@���It�̟�.qcp#=�z3o��t#Vp!T%֊*hA�0���N253I�]N��M~��$�;:�[��NT�w3�!�g>�E1;9�Cp&�kӒ�7��ST��������f%�&��L���l�Ȯ�Q� < �����'O�V+����I�M�K� \XEv*�RGK�V����RT�V���3T��F�r��w��x*&j^�"&������V�ލ���
do./��KߙI4N�ۯ+HRp�u��l���B��_m�v����������c�ә1u�� �B�X*Z��>��{�a� VbWw      �   �   x�+I,�wH�*OM��K��*���
5�50�4�4202�5��54�0AL32��H�K��wH�O��͇j��kF�a��A��ļ��̼̼<�����=��.@�F �&P���@LC#����� ]�,#      �   $  x�-�=JCAF�y{�c��L����ܹCbt�E���*j@A�ZZ$p7�Ow�D���s�F��I��s�#n|N1e+��,&�c4d������tY#��V��m��?���yƶ/K6��S��q�jO���Ӝ�iǒS�pՑjKA�D��x6��%�(���XT�R�2:�Ƀ�^���n���%���9�tqNq��À�Jӿ-���f�f����(x�ZaH���8[ƻ�1Y���SV�%EJ�����c�{u�6�7�O�lJ��˸�������������M��p{x     