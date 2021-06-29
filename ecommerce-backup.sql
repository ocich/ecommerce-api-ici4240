PGDMP     +    /                y            dakc6g0ckutheu     13.3 (Ubuntu 13.3-1.pgdg20.04+1)    13.3 -    �           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            �           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            �           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            �           1262    14537894    dakc6g0ckutheu    DATABASE     c   CREATE DATABASE dakc6g0ckutheu WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE = 'en_US.UTF-8';
    DROP DATABASE dakc6g0ckutheu;
                qcyhiiboklkohe    false            �           0    0    DATABASE dakc6g0ckutheu    ACL     A   REVOKE CONNECT,TEMPORARY ON DATABASE dakc6g0ckutheu FROM PUBLIC;
                   qcyhiiboklkohe    false    4059            �           0    0    SCHEMA public    ACL     �   REVOKE ALL ON SCHEMA public FROM postgres;
REVOKE ALL ON SCHEMA public FROM PUBLIC;
GRANT ALL ON SCHEMA public TO qcyhiiboklkohe;
GRANT ALL ON SCHEMA public TO PUBLIC;
                   qcyhiiboklkohe    false    5            �           0    0    LANGUAGE plpgsql    ACL     1   GRANT ALL ON LANGUAGE plpgsql TO qcyhiiboklkohe;
                   postgres    false    663            �            1259    14539156    brands    TABLE     �   CREATE TABLE public.brands (
    brand_id uuid DEFAULT gen_random_uuid() NOT NULL,
    name character varying(50) NOT NULL,
    url_image text NOT NULL
);
    DROP TABLE public.brands;
       public         heap    qcyhiiboklkohe    false            �            1259    14539165 
   categories    TABLE     �   CREATE TABLE public.categories (
    category_id uuid DEFAULT gen_random_uuid() NOT NULL,
    name character varying(50) NOT NULL,
    url_image text NOT NULL
);
    DROP TABLE public.categories;
       public         heap    qcyhiiboklkohe    false            �            1259    14549299    orders    TABLE     �   CREATE TABLE public.orders (
    order_id uuid DEFAULT gen_random_uuid() NOT NULL,
    user_id uuid NOT NULL,
    create_at date DEFAULT CURRENT_TIMESTAMP,
    total_price integer
);
    DROP TABLE public.orders;
       public         heap    qcyhiiboklkohe    false            �            1259    14539189    products    TABLE     F  CREATE TABLE public.products (
    product_id uuid DEFAULT gen_random_uuid() NOT NULL,
    brand_id uuid,
    category_id uuid,
    title character varying(150) NOT NULL,
    price integer NOT NULL,
    stock integer NOT NULL,
    description text NOT NULL,
    url_image text NOT NULL,
    average_score numeric DEFAULT 0
);
    DROP TABLE public.products;
       public         heap    qcyhiiboklkohe    false            �            1259    14549314    products_orders    TABLE     �   CREATE TABLE public.products_orders (
    order_id uuid NOT NULL,
    product_id uuid NOT NULL,
    quantity integer NOT NULL,
    rated boolean DEFAULT false NOT NULL
);
 #   DROP TABLE public.products_orders;
       public         heap    qcyhiiboklkohe    false            �            1259    14539210    products_shopping_carts    TABLE     �   CREATE TABLE public.products_shopping_carts (
    product_id uuid NOT NULL,
    cart_id uuid NOT NULL,
    quantity integer NOT NULL
);
 +   DROP TABLE public.products_shopping_carts;
       public         heap    qcyhiiboklkohe    false            �            1259    14548784    ratings    TABLE     �   CREATE TABLE public.ratings (
    rating_id uuid DEFAULT gen_random_uuid() NOT NULL,
    user_id uuid NOT NULL,
    product_id uuid NOT NULL,
    score integer NOT NULL,
    comment text
);
    DROP TABLE public.ratings;
       public         heap    qcyhiiboklkohe    false            �            1259    14538655    shopping_carts    TABLE     �   CREATE TABLE public.shopping_carts (
    cart_id uuid DEFAULT gen_random_uuid() NOT NULL,
    user_id uuid,
    total_price integer DEFAULT 0
);
 "   DROP TABLE public.shopping_carts;
       public         heap    qcyhiiboklkohe    false            �            1259    14538499    users    TABLE       CREATE TABLE public.users (
    user_id uuid DEFAULT gen_random_uuid() NOT NULL,
    firstname text NOT NULL,
    lastname text NOT NULL,
    email text NOT NULL,
    password text NOT NULL,
    idcard character varying(13) NOT NULL,
    region character varying(100) NOT NULL,
    commune character varying(100) NOT NULL,
    residence_address character varying(100) NOT NULL,
    role character varying(8) DEFAULT 'CLIENT'::character varying,
    status character varying(11) DEFAULT 'ACTIVE'::character varying
);
    DROP TABLE public.users;
       public         heap    qcyhiiboklkohe    false            �          0    14539156    brands 
   TABLE DATA           ;   COPY public.brands (brand_id, name, url_image) FROM stdin;
    public          qcyhiiboklkohe    false    202   $;       �          0    14539165 
   categories 
   TABLE DATA           B   COPY public.categories (category_id, name, url_image) FROM stdin;
    public          qcyhiiboklkohe    false    203   �=       �          0    14549299    orders 
   TABLE DATA           K   COPY public.orders (order_id, user_id, create_at, total_price) FROM stdin;
    public          qcyhiiboklkohe    false    207   �>       �          0    14539189    products 
   TABLE DATA           �   COPY public.products (product_id, brand_id, category_id, title, price, stock, description, url_image, average_score) FROM stdin;
    public          qcyhiiboklkohe    false    204   @       �          0    14549314    products_orders 
   TABLE DATA           P   COPY public.products_orders (order_id, product_id, quantity, rated) FROM stdin;
    public          qcyhiiboklkohe    false    208   IT       �          0    14539210    products_shopping_carts 
   TABLE DATA           P   COPY public.products_shopping_carts (product_id, cart_id, quantity) FROM stdin;
    public          qcyhiiboklkohe    false    205   �U       �          0    14548784    ratings 
   TABLE DATA           Q   COPY public.ratings (rating_id, user_id, product_id, score, comment) FROM stdin;
    public          qcyhiiboklkohe    false    206   NV       �          0    14538655    shopping_carts 
   TABLE DATA           G   COPY public.shopping_carts (cart_id, user_id, total_price) FROM stdin;
    public          qcyhiiboklkohe    false    201   "Y       �          0    14538499    users 
   TABLE DATA           �   COPY public.users (user_id, firstname, lastname, email, password, idcard, region, commune, residence_address, role, status) FROM stdin;
    public          qcyhiiboklkohe    false    200   �Y       4           2606    14539164    brands brands_pkey 
   CONSTRAINT     V   ALTER TABLE ONLY public.brands
    ADD CONSTRAINT brands_pkey PRIMARY KEY (brand_id);
 <   ALTER TABLE ONLY public.brands DROP CONSTRAINT brands_pkey;
       public            qcyhiiboklkohe    false    202            6           2606    14539173    categories categories_pkey 
   CONSTRAINT     a   ALTER TABLE ONLY public.categories
    ADD CONSTRAINT categories_pkey PRIMARY KEY (category_id);
 D   ALTER TABLE ONLY public.categories DROP CONSTRAINT categories_pkey;
       public            qcyhiiboklkohe    false    203            >           2606    14549305    orders orders_pkey 
   CONSTRAINT     V   ALTER TABLE ONLY public.orders
    ADD CONSTRAINT orders_pkey PRIMARY KEY (order_id);
 <   ALTER TABLE ONLY public.orders DROP CONSTRAINT orders_pkey;
       public            qcyhiiboklkohe    false    207            @           2606    14549318 $   products_orders products_orders_pkey 
   CONSTRAINT     t   ALTER TABLE ONLY public.products_orders
    ADD CONSTRAINT products_orders_pkey PRIMARY KEY (order_id, product_id);
 N   ALTER TABLE ONLY public.products_orders DROP CONSTRAINT products_orders_pkey;
       public            qcyhiiboklkohe    false    208    208            8           2606    14539197    products products_pkey 
   CONSTRAINT     \   ALTER TABLE ONLY public.products
    ADD CONSTRAINT products_pkey PRIMARY KEY (product_id);
 @   ALTER TABLE ONLY public.products DROP CONSTRAINT products_pkey;
       public            qcyhiiboklkohe    false    204            :           2606    14539214 4   products_shopping_carts products_shopping_carts_pkey 
   CONSTRAINT     �   ALTER TABLE ONLY public.products_shopping_carts
    ADD CONSTRAINT products_shopping_carts_pkey PRIMARY KEY (cart_id, product_id);
 ^   ALTER TABLE ONLY public.products_shopping_carts DROP CONSTRAINT products_shopping_carts_pkey;
       public            qcyhiiboklkohe    false    205    205            <           2606    14548798    ratings ratings_pkey 
   CONSTRAINT     Y   ALTER TABLE ONLY public.ratings
    ADD CONSTRAINT ratings_pkey PRIMARY KEY (rating_id);
 >   ALTER TABLE ONLY public.ratings DROP CONSTRAINT ratings_pkey;
       public            qcyhiiboklkohe    false    206            2           2606    14538660 "   shopping_carts shopping_carts_pkey 
   CONSTRAINT     e   ALTER TABLE ONLY public.shopping_carts
    ADD CONSTRAINT shopping_carts_pkey PRIMARY KEY (cart_id);
 L   ALTER TABLE ONLY public.shopping_carts DROP CONSTRAINT shopping_carts_pkey;
       public            qcyhiiboklkohe    false    201            .           2606    14538511    users users_email_key 
   CONSTRAINT     Q   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key UNIQUE (email);
 ?   ALTER TABLE ONLY public.users DROP CONSTRAINT users_email_key;
       public            qcyhiiboklkohe    false    200            0           2606    14538509    users users_pkey 
   CONSTRAINT     S   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (user_id);
 :   ALTER TABLE ONLY public.users DROP CONSTRAINT users_pkey;
       public            qcyhiiboklkohe    false    200            H           2606    14549306    orders orders_user_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.orders
    ADD CONSTRAINT orders_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(user_id) ON DELETE CASCADE;
 D   ALTER TABLE ONLY public.orders DROP CONSTRAINT orders_user_id_fkey;
       public          qcyhiiboklkohe    false    3888    207    200            B           2606    14539198    products products_brand_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.products
    ADD CONSTRAINT products_brand_id_fkey FOREIGN KEY (brand_id) REFERENCES public.brands(brand_id) ON DELETE CASCADE;
 I   ALTER TABLE ONLY public.products DROP CONSTRAINT products_brand_id_fkey;
       public          qcyhiiboklkohe    false    204    3892    202            C           2606    14539203 "   products products_category_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.products
    ADD CONSTRAINT products_category_id_fkey FOREIGN KEY (category_id) REFERENCES public.categories(category_id) ON DELETE CASCADE;
 L   ALTER TABLE ONLY public.products DROP CONSTRAINT products_category_id_fkey;
       public          qcyhiiboklkohe    false    3894    204    203            I           2606    14549319 -   products_orders products_orders_order_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.products_orders
    ADD CONSTRAINT products_orders_order_id_fkey FOREIGN KEY (order_id) REFERENCES public.orders(order_id) ON DELETE CASCADE;
 W   ALTER TABLE ONLY public.products_orders DROP CONSTRAINT products_orders_order_id_fkey;
       public          qcyhiiboklkohe    false    3902    208    207            J           2606    14549324 /   products_orders products_orders_product_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.products_orders
    ADD CONSTRAINT products_orders_product_id_fkey FOREIGN KEY (product_id) REFERENCES public.products(product_id) ON DELETE CASCADE;
 Y   ALTER TABLE ONLY public.products_orders DROP CONSTRAINT products_orders_product_id_fkey;
       public          qcyhiiboklkohe    false    204    3896    208            D           2606    14539215 <   products_shopping_carts products_shopping_carts_cart_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.products_shopping_carts
    ADD CONSTRAINT products_shopping_carts_cart_id_fkey FOREIGN KEY (cart_id) REFERENCES public.shopping_carts(cart_id) ON DELETE CASCADE;
 f   ALTER TABLE ONLY public.products_shopping_carts DROP CONSTRAINT products_shopping_carts_cart_id_fkey;
       public          qcyhiiboklkohe    false    201    205    3890            E           2606    14539220 ?   products_shopping_carts products_shopping_carts_product_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.products_shopping_carts
    ADD CONSTRAINT products_shopping_carts_product_id_fkey FOREIGN KEY (product_id) REFERENCES public.products(product_id) ON DELETE CASCADE;
 i   ALTER TABLE ONLY public.products_shopping_carts DROP CONSTRAINT products_shopping_carts_product_id_fkey;
       public          qcyhiiboklkohe    false    3896    205    204            G           2606    14548806    ratings ratings_product_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.ratings
    ADD CONSTRAINT ratings_product_id_fkey FOREIGN KEY (product_id) REFERENCES public.products(product_id) ON DELETE CASCADE;
 I   ALTER TABLE ONLY public.ratings DROP CONSTRAINT ratings_product_id_fkey;
       public          qcyhiiboklkohe    false    206    3896    204            F           2606    14548801    ratings ratings_user_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.ratings
    ADD CONSTRAINT ratings_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(user_id) ON DELETE CASCADE;
 F   ALTER TABLE ONLY public.ratings DROP CONSTRAINT ratings_user_id_fkey;
       public          qcyhiiboklkohe    false    200    206    3888            A           2606    14538661 *   shopping_carts shopping_carts_user_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.shopping_carts
    ADD CONSTRAINT shopping_carts_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(user_id) ON DELETE CASCADE;
 T   ALTER TABLE ONLY public.shopping_carts DROP CONSTRAINT shopping_carts_user_id_fkey;
       public          qcyhiiboklkohe    false    201    200    3888            �   [  x���KO[1�������?�PEA*�@m����.j����_�!Bm�ew���s�̱C+	s̺�I��km bV�&-3�f���k��x�.���Z��$�h	&��| FL�Ī���e1�l��m��%��7�~
B�D�:���mF�~��[:�\����fV�S*!k'R�V�T���ٖc 櫮5���dA��zc���Q�,�(5�O]��on�ݶ:W+"�d�[��bm��W�Rn���Y웻axX��E�7C�0�B��VC������nge���O�.s��&��7����$�Q8�|8_�� O�Ɍ߭W���G7��(U6��
[�E2��VY��t�P����y��O�i������y?Z=�#1�]Ma���ѣ���[�_��������\�-*4��r��-WlY|I!Z�80R�i��s�U��9��Kh�}�'�d"�Rm�*�QRsUrgU5VSL�L欆�x���Nj�T���R���B>G	'4sk�Z �ס��W�h9높�vE�J�j�s1�|
Te���dᏱ^;��EjQ��W�*b-	*��9&+���\,w��{m��puf      �   	  x���;N�@Ek{/���ѥD�Q"�7of�!�-¢�XB6FD�D��6�{E��G�\DЦ � 6D��<v�uk��ui7�Q��6�e*��k�L�ܘ`�kôQ�9�5[�5m�6vW��Q�E<+�OƘa�_zP�6%�O��.�6d�C��nK�R�ڮ����ۇ?����#�B.G��20q	���B���D������%�s��D�a"l�oG�O,�
���,��6G�mq�{̴�t���f�=�4�}�8�:      �   ]  x���A�]1��݅ƀ�.�`���0�M�?����-�D���!ƺ�Q����R�8 F8��V�#�$z:߇���3&/ė�+9��w��7{��<x���!{=L���s�]���6��h�>���gs��=*X	��q���p��C������ѵ����&���d��6�o�Ң`�+l�¦Έ��7=H���쿅����u0���&��MZD�v��^�sk�����1L� ;4/���(���ˊnd�C\��|,a�u��h���P�5�l�
ئ��¤В���;r�E�|��ںl)���G{}��L�5���'����{������__������q      �      x��Z͎�F�]+OQ��j��'������,��;��b���C�
:ݽ����y�.�0�f�� ��d^`^aέ���� Nz��`@VSd��{��ܪPxaj�gBE�Km�ۊx�$���R~8pef��s)��{Q�$�3n�@�i�E�L���o�>���IQ�'K��Y�J<d�3���ó9;��K6�v����l4�:.���r8z�^�ly�|`;qlY�h����V=�ѰT5J�++֪R���N1U�u^3U��b]�ҼQ�������>a�Z�,�J�W�(�T��ѸY.��IS]+���V�����mY�㖲�wފD�7��x մU�p����.or�[l�7<e�6�ꔍ���e��۶��Qr���%�����	={�7���(�Y�GYm��j���eUT��O�],_�ͳl����F�l���hs���م��I�ޛN�T8�}�)�=+�YQ�W����}ש5����3I�x���cpӶ���g�dZ�67�6��O�ϚgY�'xf?�,�����,"�ٶ��N��33���\�/�e+%\�7Rܓa�&<�I�E��i2�2���▧��D	��@�'^�خ�ڿ�G�|�/_��t:������b��G�C;���~�j�T�=���:/���� (n���h	��<#�LG�}<�a��~D|4��a��F��j�[W۪�ȭ�Ёz׭q/Q!0໪��&y)d����x�y�ԪL�M���G:�����VPp� �t|��ݶ3�ַ�,ɋn�h�&Ȩ��tu�~Ш��w��&��>�@��_k%���t���!6z�(s����x[)0�:7���~.�a���{<��>���-!1S�n��0���q�� Y�8�/�f�
� q�F�ͽЋx�g R7��4s���{z_N�l�ʲ@�>���g=2�}��Q�w� 6�jN0�8��L�A�+��B�wRQ.���4�"�u*�aB����\�S�"��&?Ʊ�N�!��i ЅR�h��w@�p�*S%��Q$��酸U{�@������<�;a�����a&�e'܉���N�q+�ad�^�s�m;� �P�!���S�<
2Wzq"���LJ�"��+�l5�0d*�Џ�V._.��+ǲ��)���7���K�q5���*p���\��]QPQ�B��!o�w�D�i^*Q�������jø�
��m	��p��8���,� �$WukJ�Xh��)�Os#~��|�k(z��9ų�[���~��HMw�,�"��÷P�Х9(sY���v��J���*5u��)�5=ė̦ʎh��KVg��O�p8��&.~u@��Q.[$�a�{�VT4���3JY�����'�D�Ì�27R�m��	H�W^__��Qw*�����I��E%��ڱ��v�m`�}���0G��G��Ц(���̗
7@�8 ÿ6��=ڶL�4�x�)D���(	w{�� �>���p��;�ɺ�dhq/�"��A!�Wg�~1����D��h:�:c��r�+�q|���Ш3�ĺ:�]!�=�2<*�.e�F/���h.r�����r��q�(�����ʿ����׿���a�|�s��4 Dt��S�~jtuK� �t`;�j��F���V��*ކ���*���媼�TA����+Bl����wKOQ?��U���X��ْ�æ+5z#���Ť�9����d#�aC��V�U���S0y����Z�Q-�4�|��l�d򛻛F2)��6�X��rj��O�V�G^TĖ���8�V&2Oy�[�#�ł�~�����i��Ah-�����r�j|��S�ͮ����tx9|1_Ά���v.�58S���4��hX�$��Z|�Xܐ-��wī8�V[�8�
�����bI\g�Օ_kJ�S������AH�$��X��	yuK�P�����­�F	��ե"*� ��Fm�#���zϽ�t��߸�F�@�*T?HJ���y������M]�׃��+m�D���Y4Cܨ�����7�����P�$7H%՚�	�)y'��� ]y��%M%����疝��(zOȄonD����F��0��=������A��J�Pr؄��@�U���ۓ2�%�g�)���:~"���2Ö!�ď#�d0�_�Ə���f���j�b�ê�\����k?rE�Pe9�����hL���0�)ʏ<b}�j���������&��	EMl�$ �z �p��"ZkP��Dw?o5.�;Q��u���%ԫ��>��V�no��� �Swd�4���Uꣵ�u�@sB�?j���حɩ�v{r�(�$���Q�z]�����⣉D��/m)�
�B�^�a2a��e���]$?��Ƞ�E�I7iq�#�:�{"Hg?��)�w&�SC��^ 3/�\.�(�3P6��I�P��0�vO-R�/|X(�@xD�ى"�D����0d�J�T8\��Z��J|жoQ*P�9�֧��	��Kv�<���`�f�f���N�_���C��mi�8օ$]�������j&��Y���^�����We}�)�:��)����=�UZa������#��S��a�=���%����ѡO�o�Pו�C:r�gg2AFŅy�����0�pʁ�'	�FQ0Ď�@;/h<�~�%��������M���rx�L�0�?��{�X�<��u(��7�"��av�Ҁـ!�`V�(�K[J�MK�[�=̺I�>���	�͟1�l6_.������՘�����p1i<�J��Xm��'���ۘ����I<��*͸'䏫|L%TwxH���t~1�f>}�����b9��"��o��S$��h2do���lr6�E�_��a~������/.ǫӷ��b�	���C��i;!|�wﷺ�T��Y�3�><������0��t��N+�>N���L�7��Fb�r���1�
wSe-�����=}B<���U���:�`���A�x�JD5�\(^�Z�ƙ�z*������/�������؃O��R�i_�MU�k���������^7.˶�
����e+N���=R��E]��o!����N;ӏ$	���4d"ZAv�2�L�y�{%�n�y�P�����Q������J�#+��F��b��j���$"U@���m_�o[h7vK��}]�vD�B�ȓj��DC����NM�#G=�]E8l[��G<�؏���|+����u�'�
�$��g������y&��	��i������WW��巃�7�Hwbwb�	�n�bM�*s�81uy�=�rxL ue� ��#5�d�@����6P��P��d�r�(��V!��U�%�k]B9��Bߎ��l'�NF�ݿi_.�V�l�� a���?�e��������s� ?v������K�˭J	��r��l��I?��-�/W��Jx`���b=�w�e��{���m9)e��S�Ŷ��<E��������V|Q益�Fܦ>�e;��E˗6(N,�=�Ch����"+M)��?;��JN/�������Z��b������_3H�A�3�]��Y����v/U��w$n�{��h����VZX4�a���pp���H׷���JJm���қD6�ݵn��u�Y_�|��n�7�h� ���ɶ��ׯo�t*����N��?���N�y��)����*1k���i�86u?��3<���
^#ʞ�i]��h��Q�U��M~�q�����u�N��t}N<�׀��ia��q��<�~RZX-�]��{BJP8��佳6�QA�˽���\(<����4�$����g�(qQ�'��8�����Pb�FC0V���圭.���3�d������v��Չt��/�S?�Ht�V�
Z�ay
%c�Ωf�D?��JI�D�͍���%���t��V��U�z�{��Hxo'�4k?X�n���G˗O�ygJ�����{�<=�~�9~�x>�3�Y��Z�B,O%���D}�s���Ⱦ��o^����|f�x�>HHQ[�����'��	����f��=/ך(ڮ���L�VD麗+   �aE{<���	�6�Y�g�D���6��Bd0pf=�Ц����K�|$�,IZ�Feܽ��cQ;��f���HSs�C�TĲ'f_GK)~@��]U��d�TI�6������}K�Z���M���S�:2ܾ�P����ڹ���37@�L ������*tE�y1��ۣ0LR��<V$�a���̊$�B	�x��]+�x� +�Q!�#<K"�C5�(ÿ�������s6ґ�_�<�鋩�^��c�,LV�K�_¸�f���ذls�y��a���j�%�^7����cd�:���׾h	F�;��6�-�VG� t�?􋩷��g�^>�g��X��z�Xԋ}����zg����	���o���-��������jJ͑=�H��x"@��̓4K=z"u��sn���a4�=��~m��a��b����r����F������je"�/���P/?^ON�l����F���dZ��}i|>_��:�7||�7���K��]�������/P݆f̯��l:=^��+6~�_'c��:�B-����j��b��x��MZ}�{����JC��oU�A�H��	<"���7>�{��`Ӽ�������5ݬ�e�価n��N�t�yAڠ�wP�E�q ��x��^�u	�4^�c�⛪�oU�S��yM�׬����� �R��Ѐr��D�or���	io�~�������K5��K{IL���i#(�cIiof�=Oz�G�➐Kz�=qR��s�o�,EZ�4斝Fnd����?�/����ח̱����y�,�д1��5`����G�q�"�g(��'�ݳ���q���Z���nO�6A��1����E~E�O��԰�ڢY���8�>o���n��ے�}?x6�%����&���7zBڽ�PZ�6���l�A6��cG�7v���������͌�w5VH��^=�<%!�.�����~�������F�����$���&���� �tæ�vWC��Z�z��]���c��]��k��S:��z'�"b�C��9�ߞ~���Z�b�      �   X  x�����$1�ݾ��H��}� ��8.Ɓ�?�dQT�
\l��@��s_;]�9�d)1`P���+����3�z�t^%׀��v�M�����F��Ki��Fu�G�� �q���x�/���cw��Z|��}F��b�y���l�u!*�M5�ga�:L�3��)�bl���҇�+�� ;��9�A��0�5��u���nǽC���+@Eu�v'�[���4��Cڂ���F�]��<+ofIod�8!zM��7?ƝG`��������A_)�AQ9�]�J�e��Xt%Ŭ>���V���|�OwjUdh���������}߿@/��      �   �   x����q 1�W/�A<�' D�%X%8��=R�4���)D̅�4ң�mO�\�� �	�ߋ�H��#�s���ˡ�2��KtY�ަ[oku��#'+�#+��"�Q�<2Uv
�;�����+������k���g��~�<q      �   �  x��TI�#G<W��>@#�$�0���-m�񨅁o��:h.BB��`#�5#�!`�h]�u$�.s��:��K�����Z"��6��B5�Ъ�2%@�K���������r���ޯ>���w>��Q���C[��	��y��G�c�Ӌbfp�-� bt��u��<�E�������w���q��?��=��ѯ���S�]���ᷯ�����_v�٥��f�~u#:�&)͔�{��PY���-�Ղ �C�N�h����po��v���w����n�i�5E`	f1�'�(��fF1��/�Pk
���2\M�v��<��`}�}�;�sw+A�g�Ώ�Ks^���-1��W�G���9�0Z:U�����=x��ӿ�Ӝ<-O�^<*�,:@ͺx|��^Ƚoo����[�p��5�ʕ�;8�OcD�b�*�8=��S���_�O� �%��wЪ�jJPh�UWAl�Y�����Q� b���#JI��㯸��SG�<��`�މփ���>v.�J�%�N�>��Ȕ��ݰ��u�7k!����rx��ev�$S��Q�Hj��z�� ���L��ܚ���ճ��R<��Fh8�?��j���o�ZW�xe4��(�)t�+ni��zԼ�$�����+ϑD�S�U��_�J���j�Q��85ɱ�d�>ڜg��b�N��c�!��� g*�ל+�5�l��}�����E      �   �   x���q@1c�^���℟�/�r�����OHb�2P��V���M�,8!�#�*���1<����9�w��L���Y:'L���kFxņV�I�;�S��-3�k�#Dx��uA�	���x�s<M����!0׆-�j�}1�w�-g2�L������F^�C�E���vb��;wf�G�w�Y6����}�:6Oy      �   f  x�eR�r�0���`�4� Ѕ�d���'M?&�<R� �&)9r��H�2E
O>A�/	�<fb�ڻ�����ȸ I}���ǣ<@�����,�	/'��B�)(ɱҺ"m_��j;�P�@iSV+��{��72��*��#L�83���6��`^Ɵ.�}��x[O��n���hY\o�-Lp*H�(	��8�F�=K�[$ƶ3l����8��$�Q2��q��M-���f�B��4v�{���[d��Z��K��J�k�^����g�},�W�Y`��.=�����x-.i�g���<�ҝ�X����8]�,��Gi���}+��1i@��Q���{Ƨ��VuEN~�2UE�ʖ��u�����NS�R�"��z�g��O��X���̒d����|�{��d+U���M\��H��y�-������OÛngy�������(��x��؜�=��?�s욪������AW�~�}�}P.	G���;@Gr(��s��8R�e��s�!jU#9��O�j�r�m���l�����i7���L��èK�h8]��+o��G\���ɨo�;�rhv`�e$]C��m�7X��V�np�6=��c,r�:{��Gs0�B�
     