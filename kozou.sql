PGDMP  "                
    |            kozou    16.4    16.4     �           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false                        0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false                       0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false                       1262    16414    kozou    DATABASE     x   CREATE DATABASE kozou WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'Japanese_Japan.932';
    DROP DATABASE kozou;
                postgres    false            �            1259    16648    category_table    TABLE     t   CREATE TABLE public.category_table (
    categorynumber integer NOT NULL,
    categoryname character varying(10)
);
 "   DROP TABLE public.category_table;
       public         heap    postgres    false            �            1259    16651    product_table    TABLE     �   CREATE TABLE public.product_table (
    productnumber character varying(10) NOT NULL,
    productname character varying(20) NOT NULL,
    categorynumber integer NOT NULL
);
 !   DROP TABLE public.product_table;
       public         heap    postgres    false            �            1259    16654    stock_table    TABLE       CREATE TABLE public.stock_table (
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
       public         heap    postgres    false            �            1259    16659    stock_table_id_seq    SEQUENCE     �   CREATE SEQUENCE public.stock_table_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 )   DROP SEQUENCE public.stock_table_id_seq;
       public          postgres    false    217                       0    0    stock_table_id_seq    SEQUENCE OWNED BY     I   ALTER SEQUENCE public.stock_table_id_seq OWNED BY public.stock_table.id;
          public          postgres    false    218            �            1259    16660 
   user_table    TABLE       CREATE TABLE public.user_table (
    nickname character varying(10) NOT NULL,
    password text NOT NULL,
    prefectures character varying(4) NOT NULL,
    sex character varying(10) NOT NULL,
    emailaddress text NOT NULL,
    dateofbirth character varying(10) NOT NULL
);
    DROP TABLE public.user_table;
       public         heap    postgres    false            \           2604    16665    stock_table id    DEFAULT     p   ALTER TABLE ONLY public.stock_table ALTER COLUMN id SET DEFAULT nextval('public.stock_table_id_seq'::regclass);
 =   ALTER TABLE public.stock_table ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    218    217            �          0    16648    category_table 
   TABLE DATA           F   COPY public.category_table (categorynumber, categoryname) FROM stdin;
    public          postgres    false    215   �       �          0    16651    product_table 
   TABLE DATA           S   COPY public.product_table (productnumber, productname, categorynumber) FROM stdin;
    public          postgres    false    216          �          0    16654    stock_table 
   TABLE DATA           �   COPY public.stock_table (id, emailaddress, productnumber, stock, startusing, enduse, perioddenominator, periodnumerator, activenumber) FROM stdin;
    public          postgres    false    217   L       �          0    16660 
   user_table 
   TABLE DATA           e   COPY public.user_table (nickname, password, prefectures, sex, emailaddress, dateofbirth) FROM stdin;
    public          postgres    false    219   C                  0    0    stock_table_id_seq    SEQUENCE SET     A   SELECT pg_catalog.setval('public.stock_table_id_seq', 28, true);
          public          postgres    false    218            ^           2606    16667 "   category_table category_table_pkey 
   CONSTRAINT     l   ALTER TABLE ONLY public.category_table
    ADD CONSTRAINT category_table_pkey PRIMARY KEY (categorynumber);
 L   ALTER TABLE ONLY public.category_table DROP CONSTRAINT category_table_pkey;
       public            postgres    false    215            d           2606    16669    user_table nickname 
   CONSTRAINT     R   ALTER TABLE ONLY public.user_table
    ADD CONSTRAINT nickname UNIQUE (nickname);
 =   ALTER TABLE ONLY public.user_table DROP CONSTRAINT nickname;
       public            postgres    false    219            f           2606    16671    user_table password 
   CONSTRAINT     R   ALTER TABLE ONLY public.user_table
    ADD CONSTRAINT password UNIQUE (password);
 =   ALTER TABLE ONLY public.user_table DROP CONSTRAINT password;
       public            postgres    false    219            `           2606    16673     product_table product_table_pkey 
   CONSTRAINT     i   ALTER TABLE ONLY public.product_table
    ADD CONSTRAINT product_table_pkey PRIMARY KEY (productnumber);
 J   ALTER TABLE ONLY public.product_table DROP CONSTRAINT product_table_pkey;
       public            postgres    false    216            b           2606    16675    stock_table stock_table_pkey 
   CONSTRAINT     Z   ALTER TABLE ONLY public.stock_table
    ADD CONSTRAINT stock_table_pkey PRIMARY KEY (id);
 F   ALTER TABLE ONLY public.stock_table DROP CONSTRAINT stock_table_pkey;
       public            postgres    false    217            h           2606    16677    user_table user_table_pkey 
   CONSTRAINT     b   ALTER TABLE ONLY public.user_table
    ADD CONSTRAINT user_table_pkey PRIMARY KEY (emailaddress);
 D   ALTER TABLE ONLY public.user_table DROP CONSTRAINT user_table_pkey;
       public            postgres    false    219            �   4   x�3�|ܴ�q���͛7Oܼ�ˈ�q�*�i'�1����_������� -p�      �   1  x���OJ�@�י�؅��$7�B�n݈G�;�y�ƍ؂�*�V�PA��y��[��M�c�˼�~�o�/?8�'�q�|G�C�#>��ee�ŧ'Q�r���J��&����d��X�|aq��z�ԉ����=���.��3����z��(g	�rE
Z�:��AK�V��B�"��a�U �����������{�c�qsZ[��ʅY2o����ڝ�6`�l��b[6\�N��!]��9q��Y ��goTGd�#�҈�|�Ugݶ����g�A��붛��oI��.�|,a�y��/��c���<�      �   �   x�}�M�@���Qvfׯ��A�!�^���Í�~}ne;�����w(�kݜ����ϐ��+��|D����Cc/?0�t�
eS�t��[}�AS�+��|.�E?�}X+��폵��"��7�U�G�aJh��*|P��E,������Rk�p[�*l(�0�����P�)�V�{P�)r�L����(��N��(�c`2pdav99n�ףbp�{��ҋ����?      �   b  x�-��jA���w������A�ܿI֒v��1v�4�1��&���.lB@�����-�Nw�|�ǧ�����~o$*I���(�#
���oΥ���Q*6T���% �������������Ƭq.���Uϛ�J�<nXk�t�q��h�� Η� �<D,�hM�("N�*XEP8�Zlt��ń�b�����ݛ�[ܨ9�d���r����.v�x1rt�8!	���]Rt�$�րy2���fg-��4��(�:s�����q��gΥ+��Vz�Z�)ݮ�FT�hj��g��F�)��z��hr���d��ͷ\��Xc�4�/3��߹u�n���$��tgˮ��Ī�g     