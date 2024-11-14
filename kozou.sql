PGDMP  7    &            
    |            kozou    16.4    16.4     �           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            �           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            �           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            �           1262    16414    kozou    DATABASE     x   CREATE DATABASE kozou WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'Japanese_Japan.932';
    DROP DATABASE kozou;
                postgres    false            �            1259    16559    category_table    TABLE     o   CREATE TABLE public.category_table (
    categorynumber integer NOT NULL,
    numberofregistrations integer
);
 "   DROP TABLE public.category_table;
       public         heap    postgres    false            �            1259    16562    product_table    TABLE     �   CREATE TABLE public.product_table (
    productnumber character varying(10) NOT NULL,
    productname character varying(20) NOT NULL,
    categorynumber integer NOT NULL,
    numberofregistrations integer
);
 !   DROP TABLE public.product_table;
       public         heap    postgres    false            �            1259    16565    stock_table    TABLE       CREATE TABLE public.stock_table (
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
       public         heap    postgres    false            �            1259    16570 
   user_table    TABLE       CREATE TABLE public.user_table (
    nickname character varying(10) NOT NULL,
    password text NOT NULL,
    prefectures character varying(4) NOT NULL,
    sex character varying(10) NOT NULL,
    emailaddress text NOT NULL,
    dateofbirth character varying(10) NOT NULL
);
    DROP TABLE public.user_table;
       public         heap    postgres    false            �          0    16559    category_table 
   TABLE DATA           O   COPY public.category_table (categorynumber, numberofregistrations) FROM stdin;
    public          postgres    false    215   �       �          0    16562    product_table 
   TABLE DATA           j   COPY public.product_table (productnumber, productname, categorynumber, numberofregistrations) FROM stdin;
    public          postgres    false    216   �       �          0    16565    stock_table 
   TABLE DATA           �   COPY public.stock_table (emailaddress, productnumber, stock, startusing, enduse, perioddenominator, periodnumerator, activenumber) FROM stdin;
    public          postgres    false    217   @       �          0    16570 
   user_table 
   TABLE DATA           e   COPY public.user_table (nickname, password, prefectures, sex, emailaddress, dateofbirth) FROM stdin;
    public          postgres    false    218   �       \           2606    16576 "   category_table category_table_pkey 
   CONSTRAINT     l   ALTER TABLE ONLY public.category_table
    ADD CONSTRAINT category_table_pkey PRIMARY KEY (categorynumber);
 L   ALTER TABLE ONLY public.category_table DROP CONSTRAINT category_table_pkey;
       public            postgres    false    215            b           2606    16578    user_table nickname 
   CONSTRAINT     R   ALTER TABLE ONLY public.user_table
    ADD CONSTRAINT nickname UNIQUE (nickname);
 =   ALTER TABLE ONLY public.user_table DROP CONSTRAINT nickname;
       public            postgres    false    218            d           2606    16580    user_table password 
   CONSTRAINT     R   ALTER TABLE ONLY public.user_table
    ADD CONSTRAINT password UNIQUE (password);
 =   ALTER TABLE ONLY public.user_table DROP CONSTRAINT password;
       public            postgres    false    218            ^           2606    16592     product_table product_table_pkey 
   CONSTRAINT     i   ALTER TABLE ONLY public.product_table
    ADD CONSTRAINT product_table_pkey PRIMARY KEY (productnumber);
 J   ALTER TABLE ONLY public.product_table DROP CONSTRAINT product_table_pkey;
       public            postgres    false    216            `           2606    16584    stock_table stock_table_pkey 
   CONSTRAINT     d   ALTER TABLE ONLY public.stock_table
    ADD CONSTRAINT stock_table_pkey PRIMARY KEY (emailaddress);
 F   ALTER TABLE ONLY public.stock_table DROP CONSTRAINT stock_table_pkey;
       public            postgres    false    217            f           2606    16586    user_table user_table_pkey 
   CONSTRAINT     b   ALTER TABLE ONLY public.user_table
    ADD CONSTRAINT user_table_pkey PRIMARY KEY (emailaddress);
 D   ALTER TABLE ONLY public.user_table DROP CONSTRAINT user_table_pkey;
       public            postgres    false    218            �      x�3�46�2�42�2�44������ ��      �   6  x���OJ�@���I�BIf��D7�#�̼�vӍX�E���Z�B-�Vo��I&��?.3�}���o�ó�x7��c�� ᳜�K(�4�8�{f
dv0��6�����t�"_�a~��y�T�Avdˁy�,f��������&S��̥neU��U����W�m>a�p�(�?�@�z����[� ��FI��%�	��H�V�N�C��͹X�'���H�P��6c�Q���N%����LWmX�p��֫a����J5��`�L���e����凪 ��޸�rm�����k�[KƑdw/�_+�Ms      �   �   x�+I,�wH�*OM��K��*���
5�50�4�4202�5��54�0AL32��H�K��wH�O��͇j��kF�a��A��ļ��̼̼<�����=��.@�F �&P���@LC#����� ]�,#      �   j  x�-�=nAF㞻쪫��;ۃ8�����ݝ�,$Dƶv� ��mv=��K_P�{zuL�G%I۔5j�j�Y��IW	\ ���%��FG���cF��@������O?����^������v\�<9UFk��~�{Mg�*�k��Q��b�"hEt�1��r����R���rIhkrj��<����ӗ53W�����ۺ��z�����Tf����A7l /��"HCS�K�"{�12�jc,V�Q��o���~����?=~�Pk��~�a��f|S���%ִu���V�p̭��B	���C�����$���Kƅl��HE��%Y�c���s�6�f��Ֆ���뎖]�=,��     