PGDMP     %                    v            testdb    10.2    10.2 %    �	           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                       false            �	           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                       false            �	           1262    16384    testdb    DATABASE     x   CREATE DATABASE testdb WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'en_US.UTF-8' LC_CTYPE = 'en_US.UTF-8';
    DROP DATABASE testdb;
             zhouhuan    false                        2615    2200    public    SCHEMA        CREATE SCHEMA public;
    DROP SCHEMA public;
             zhouhuan    false            �	           0    0    SCHEMA public    COMMENT     6   COMMENT ON SCHEMA public IS 'standard public schema';
                  zhouhuan    false    3                        3079    12544    plpgsql 	   EXTENSION     ?   CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;
    DROP EXTENSION plpgsql;
                  false            �	           0    0    EXTENSION plpgsql    COMMENT     @   COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';
                       false    1            �            1259    16385    alembic_version    TABLE     Q   CREATE TABLE alembic_version (
    version_num character varying(32) NOT NULL
);
 #   DROP TABLE public.alembic_version;
       public         zhouhuan    false    3            �            1259    16419    chapter    TABLE     :  CREATE TABLE chapter (
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    id integer NOT NULL,
    name character varying(128),
    description character varying(256),
    vedio_url character varying(256),
    vedio_duration character varying(24),
    course_id integer
);
    DROP TABLE public.chapter;
       public         zhouhuan    false    3            �            1259    16417    chapter_id_seq    SEQUENCE        CREATE SEQUENCE chapter_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 %   DROP SEQUENCE public.chapter_id_seq;
       public       zhouhuan    false    202    3            �	           0    0    chapter_id_seq    SEQUENCE OWNED BY     3   ALTER SEQUENCE chapter_id_seq OWNED BY chapter.id;
            public       zhouhuan    false    201            �            1259    16402    course    TABLE       CREATE TABLE course (
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    id integer NOT NULL,
    name character varying(128) NOT NULL,
    author_id integer,
    description character varying(256),
    image_url character varying(256)
);
    DROP TABLE public.course;
       public         zhouhuan    false    3            �            1259    16400    course_id_seq    SEQUENCE     ~   CREATE SEQUENCE course_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 $   DROP SEQUENCE public.course_id_seq;
       public       zhouhuan    false    200    3            �	           0    0    course_id_seq    SEQUENCE OWNED BY     1   ALTER SEQUENCE course_id_seq OWNED BY course.id;
            public       zhouhuan    false    199            �            1259    16392    user    TABLE     @  CREATE TABLE "user" (
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    id integer NOT NULL,
    username character varying(32) NOT NULL,
    email character varying(64) NOT NULL,
    password character varying(256) NOT NULL,
    role smallint,
    job character varying(64)
);
    DROP TABLE public."user";
       public         zhouhuan    false    3            �            1259    16390    user_id_seq    SEQUENCE     |   CREATE SEQUENCE user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 "   DROP SEQUENCE public.user_id_seq;
       public       zhouhuan    false    198    3            �	           0    0    user_id_seq    SEQUENCE OWNED BY     /   ALTER SEQUENCE user_id_seq OWNED BY "user".id;
            public       zhouhuan    false    197            	           2604    16422 
   chapter id    DEFAULT     Z   ALTER TABLE ONLY chapter ALTER COLUMN id SET DEFAULT nextval('chapter_id_seq'::regclass);
 9   ALTER TABLE public.chapter ALTER COLUMN id DROP DEFAULT;
       public       zhouhuan    false    202    201    202            	           2604    16405 	   course id    DEFAULT     X   ALTER TABLE ONLY course ALTER COLUMN id SET DEFAULT nextval('course_id_seq'::regclass);
 8   ALTER TABLE public.course ALTER COLUMN id DROP DEFAULT;
       public       zhouhuan    false    200    199    200            	           2604    16395    user id    DEFAULT     V   ALTER TABLE ONLY "user" ALTER COLUMN id SET DEFAULT nextval('user_id_seq'::regclass);
 8   ALTER TABLE public."user" ALTER COLUMN id DROP DEFAULT;
       public       zhouhuan    false    197    198    198            �	          0    16385    alembic_version 
   TABLE DATA               /   COPY alembic_version (version_num) FROM stdin;
    public       zhouhuan    false    196   &       �	          0    16419    chapter 
   TABLE DATA               o   COPY chapter (created_at, updated_at, id, name, description, vedio_url, vedio_duration, course_id) FROM stdin;
    public       zhouhuan    false    202   7&       �	          0    16402    course 
   TABLE DATA               ^   COPY course (created_at, updated_at, id, name, author_id, description, image_url) FROM stdin;
    public       zhouhuan    false    200   (6       �	          0    16392    user 
   TABLE DATA               [   COPY "user" (created_at, updated_at, id, username, email, password, role, job) FROM stdin;
    public       zhouhuan    false    198   �E       �	           0    0    chapter_id_seq    SEQUENCE SET     7   SELECT pg_catalog.setval('chapter_id_seq', 123, true);
            public       zhouhuan    false    201            �	           0    0    course_id_seq    SEQUENCE SET     5   SELECT pg_catalog.setval('course_id_seq', 20, true);
            public       zhouhuan    false    199            �	           0    0    user_id_seq    SEQUENCE SET     2   SELECT pg_catalog.setval('user_id_seq', 2, true);
            public       zhouhuan    false    197            	           2606    16389 #   alembic_version alembic_version_pkc 
   CONSTRAINT     c   ALTER TABLE ONLY alembic_version
    ADD CONSTRAINT alembic_version_pkc PRIMARY KEY (version_num);
 M   ALTER TABLE ONLY public.alembic_version DROP CONSTRAINT alembic_version_pkc;
       public         zhouhuan    false    196            	           2606    16427    chapter chapter_pkey 
   CONSTRAINT     K   ALTER TABLE ONLY chapter
    ADD CONSTRAINT chapter_pkey PRIMARY KEY (id);
 >   ALTER TABLE ONLY public.chapter DROP CONSTRAINT chapter_pkey;
       public         zhouhuan    false    202            	           2606    16410    course course_pkey 
   CONSTRAINT     I   ALTER TABLE ONLY course
    ADD CONSTRAINT course_pkey PRIMARY KEY (id);
 <   ALTER TABLE ONLY public.course DROP CONSTRAINT course_pkey;
       public         zhouhuan    false    200            	           2606    16397    user user_pkey 
   CONSTRAINT     G   ALTER TABLE ONLY "user"
    ADD CONSTRAINT user_pkey PRIMARY KEY (id);
 :   ALTER TABLE ONLY public."user" DROP CONSTRAINT user_pkey;
       public         zhouhuan    false    198            	           1259    16433    ix_chapter_name    INDEX     C   CREATE UNIQUE INDEX ix_chapter_name ON chapter USING btree (name);
 #   DROP INDEX public.ix_chapter_name;
       public         zhouhuan    false    202            	           1259    16416    ix_course_name    INDEX     A   CREATE UNIQUE INDEX ix_course_name ON course USING btree (name);
 "   DROP INDEX public.ix_course_name;
       public         zhouhuan    false    200            	           1259    16398    ix_user_email    INDEX     A   CREATE UNIQUE INDEX ix_user_email ON "user" USING btree (email);
 !   DROP INDEX public.ix_user_email;
       public         zhouhuan    false    198            		           1259    16399    ix_user_username    INDEX     G   CREATE UNIQUE INDEX ix_user_username ON "user" USING btree (username);
 $   DROP INDEX public.ix_user_username;
       public         zhouhuan    false    198            	           2606    16428    chapter chapter_course_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY chapter
    ADD CONSTRAINT chapter_course_id_fkey FOREIGN KEY (course_id) REFERENCES course(id) ON DELETE CASCADE;
 H   ALTER TABLE ONLY public.chapter DROP CONSTRAINT chapter_course_id_fkey;
       public       zhouhuan    false    2317    200    202            	           2606    16411    course course_author_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY course
    ADD CONSTRAINT course_author_id_fkey FOREIGN KEY (author_id) REFERENCES "user"(id) ON DELETE CASCADE;
 F   ALTER TABLE ONLY public.course DROP CONSTRAINT course_author_id_fkey;
       public       zhouhuan    false    2315    198    200            �	      x��40J�H33HKI3����� ,      �	   �  x��\˒۸]�_��x�v��S����<2YMU�-�6+�(����}����j�.w��u{q �ǹ/�Z�?���V��H���k�U���B�ǰ��_�K�t��;��x	�u����_����r7o�컧�>���u���w=n�����f;\�c�x���7���N��A�ߡ۾�oBٍrB�z�uJ10!�B����c��a�>\?�ݥ��e(�Pꍴ,�F˖A�h���t_�C���P������5}��C�]u�U�uukXԭ����:v�K�Ç�����H�
�:t�Ћa�_��׾ r�Q��i��N�FX�ەv�{݅}�^ 2�x8T��|�8KG?��q�](��~#k�����)�~��E��X}��G!�tU7B��q���kO�@�YQ+��1_��}:�O��Иc�����߹��a�zi�hş����q=W 2�C��ù�V�܌����j�
/�$�[}���?�f��a��{(ɧ�;힠��1@J9��pƍ�c�s�z#�s��Z�5ШZ��{��� ��~{�����q{�>�Y�Rj&&����_�+�N�n ����|�!z��p�FKnS;n#���Ϥ��@1�C�!O�/��i�� ��tPo6���j�u�h��p��[��h���}��z��C��nKj��Xß¶��@m1���S �n��-��!�z�*�����P�T�9�Z֒�����n9>_Cr*�K �r��x�w/I���(v��@Ac�;|�p���}���4]ww�~�/8� ����qE���̚=���a\i�&�o�M�'�kr���Ϸ�g8ѕ�/�t��Ѱ>"h};1G�� G���x��	�&��ƞρ�ק~[6�h�CX�zN+�s�Lڻ���]���!`ud���n$�mlSs`S�
��&��￺�� n$�AD�Q�_R޳p�c���z��m�p��fp���]H�R��hş��<yH�!���&�X;���س>u��>	I��;�#��xAc�$;L�G(z�zc��Qmt���v��I��G��%�����E鋂�������U����b��a�D��D%��x���.���	�4$9,|ǲ1���es�W���{���&�_iw��Y
�4{��)x��9�G.ae+����W�[|Ȩ9D�"=!g2;���T$:Μ�셚�bպ����P�<��]�Q{\��܅1�'?�8�~Wu�T�e�	�),�YJ��[!#��dJ4��P��{L-��m8z?���HΊ^���4��A� Sr��M�<�B��CLB��}��#��t\�Е������$b��.l����H$�dA�QQ�m�u ���N�r��R����D�8����5R J�ѓ�͗KA��F��愨l)��mSq���}e�7��|���hZg��5\ZL��T��VY̡?�i]q�s9e{ݟ��ׂj�kj�4p�#�H���%`����j��.ˆ�;��T�xdi��q��ar]��[�Hk,C�I��	�r+Q��1A!M-���{Wڰ}1�����󜲐1� d�Kf��~��t��
H����D�w=.����C5�]N����L�=е��ֲ=���s-�^%��1�hZddE�$�^���DXF�D�;��du�[ҽ��A���Ky��H.��۶ 
ƀ(�ԉ�ё�"�Ď���k�7�s�A����iչK��h}�^]�r���q�����Phv�fQj�Qu+v���()jy�3d_�8�q��@<�K�q >�P��|.X�S��Hze%S]�3�x�u.�u�����gz*�뚿t�H5$�/��E�,:Dt��NE�+�E�:��q[�0IB��o�I��dm7 6#9獪A��x7�arT���uZT6�����A�"QN9�����璬-�V�W6A��9 2��r���d�d^�8�{ϥ'pX�m��M�O�7J�ֽ7����~�t�Qa{3�]x�%�Ӎ�{�6օ��������Y�A��FY[#~]��r±*Įh(�f��1^�ґ(�%{�س8� �z���K?�6��ӱ/Z޴�4�9�$%$r�r�Ĉ��4i��<|�w�����,����VqCL$Z/��5��� ��U��O=�O,��|��ջm<C�|�M9_4�X�ȭ∿t�C��T "`DʗH����mi晎��j������21%��*_�Ǐ�K�_¾d�U6��O��Z2ԓD�P�ﺉm��
hv.RѸ�x���Q[��@"�E3A����vp�X:��lA7�7J��%C���
|�ٽeV/�lė.��͓�4�h�R��2ߪ�]
�p���yi��L��y��+[PbTתf/�
��saj{�+���/[W�MRY�%E�@���Ǟ�o�!/]��Ἅ��]v�A򷭥y>@FQ+Oʹ�n��zf*�'V-��^�O�L���a��9DH��!7�j7��y���y����^L�r�M�2������S�r���)��K�⍬9薩���	0���4�3G���m���l���ck�X�߻m8�N8���ta���	s�l7��o�y�(�嚤i�nj���:ʔ��m�Q���`�5��p?�k�K3�&-.X��~C�O�oP!�r�����YV�)K�h	]);��x��6��A����bӰI�p/1�AC��J��8�s׊wq�uiS�l](-���~�^�Zq:��8���ȋ9�����X%�`Z6�TF�Wd��s"u1ƕm^[��	�G�"ZI!bX	�����<��IQ�K��k��6��h�"iژ��ƗȦ��<HnÌD�h5�523��O�hk��X^)el�p"mDk�/)'�R�4T��Jo���N/3�%V��=d=y3%�a�a 0���O�k)u��'���T]L��� d��\�����*��afZ$Quu�!�R�yR�Ӵ<.e��D�h�%�S��2\��ظ�[��CQ��qM-��LT�Z�B���{���~w�z���y*n���n$Ӻ!���c�<�������#�n��ڀe!���\!)�r]8�G0�`=�pA�*���'۴��i��X��J<"�� 5��ElMi9�1��$Ҹ���+��+<yߨ������(�eވw4��w\�˼n'�Bٮ�vw�{f��D`j˘�4p3�V^7�{�)������|~GKڥc� ���WDRg�S�՜������3��|�[w�s��#�-j�*�4dˍ�E�8��e'��	W+��I��^2��sq&���d ؖ��!?�x���<L�Z9�����Y�t����@���׵�i�y��7(*�!F�A�;O΃���z1s~�ZP�Y=ڲ@Um5�!HD�)%~�����S��ێ5�k,�_������˚k�A��O{���3,�q�V�y�a1Ȳ����I,�1ѦmmV�;Yvf�N��i��&���ۢFi�;��q�$�5�6����R�L!>����."���Z)�0Y�����paJXo�yi; m�-�GN��,nOQ���ʤ.Ƽ��b}1O�f,T�Y��#R���̡���jsk˼��D�E�kإ��f��AJ#�E���fM9J��`�4���u���ŉ���q�N��߼,&��Si6n�e�/ȴo�ϋgL�QY��J��>5��K�a�i^�E�2Dۑ��-�rM"""�~�~F���AO��a�I�9��}Ր�s�j�F��x҈_��%s����J��[{�\z�8^QCM3+���I��ߋܭ�����!��85���*�Y�Lcѡ-MC�i�*�r���Kk˟g�t3!�;�n���f-��j��V[�nh�m����3S��X�k7����ZqF�_���*R�����6����2 ���9���`���
�4��t�ɣ���2�6�!�e��h9۸;G����"]�H3%��ϱw�k�yKp8*��R��W�����{�˅���2&�@���>����<��^a��~다����W�~����ӎ"�      �	   �  x��ZIWI>���3��v�v�e^ovw{iO����\Զ�f�ai�ob��@ a6b��"��6 T��veV��0��$,Mk�/�lT�����~)������+N�C���>��W����H�&C>��H,Yb+ՙӏ�%�:�Ԓ1���K�l|�b��mV�����=]1қ���{$�b���X����z5{�/�?���H�O�����bQ+��pV}=�8���X�U�񆭌,'�JXܱr�����;���6���6��LN+Nj�+��<������#Q;Ԋ�'OL�����zy�(L�UGrz孾�0��������g,�Z+M�阱��vDs,5�sY�d�V��Jρؚ�<�����DM+�Av���R��6ΖYf�O%y*�p>1F*@Jz<0���ٵk{��wv�v�t�^���,�_�>w_S<��+�n�Wv����<��I�:��|Z�0����U��ٜ���˯�S�Z1���:�b�|n�O�YiƮy�ȅ�<��Nӌ CS���j&��Yt�F����S#�E���I�,9�ң@��������
���<�ո���t4@[[[�rĪ�(�صF��V���Ev6��s|f��!3�9o�l������﫳y)�@e��'��l��d5�Ț����lc��z���[����́���g�i�YSS��~�j���3\��7]��؄��
�聾�j�+}}H���4�'�3��y��i^¦,�	��4Ĭv�2����hn�.��jb�0�\�iS�����fu<|
8��8[��D��x|ZSw�~��mA��)�$�׏덕Ng'���p��;�Q�y��g#h������&~��)#��aU�<�A,�-A�h�6z8�շ'����JA	`��t���VD۾֊+��O�S]y	�vT${� e���k�"ũ���Hq:��[z��I�L�|����Ze�Es���&Nj�!��Q� �]��:t,VNٖ��O(�|�x�F'�JB�ݾ����>��w��њ�}���nx��%5f���j��P䊿\���7����1�
vw�<�+��.� �PhCf
'�7�M?1U����a�7�ܲ�;�::VL>A�
���Zev䥴陥m���ã�U��;�~A�F��C,
ًgJ,~Ԏ�ŭ�|^���E����L���G�F��k��B�&��
�6�}2�L��!X�G8�PD�5uBW'!����Ȋq\ ű�u�Y�t�t��Qؑ�S����F�}`���W�遨��@����:7.%acM�@�Ők[L ]}�*$�E>�>��k��$XLԝ�Qi��5Uh[b��KFa��o�!;5�����I���M=n�l0N�c�I�J;��Q.n��i8=�f��|�W�?���~JQ��y�! �:�f��vA���@þ������3h�H��,�'2F���G�=iИ:f� )@�� �Ҏ(�X���uu��8�����~�Q����]�)�d��������);�����O����� ο�p`,Y�;��&6Go��E���O� &Ѣӳ�I�)�p��/A��ܢ���3z�%F��2�(���D�x�\S�q��y��Ɨ��@݁�ׯ8=��V�\���%�T	�B0̑d�����ٶ�(!�NÈ@
gQ�1F�e �/�"�� e��EDJa�5����Ʒ�sd���xԅ���?n������i����G��m��b�I:91�����I�d ��Zل��`�Af�����Q���j總��	H�E��r�<M�b�z���.����pϣ�W_��L5����F `�Ǹr�Ů^��w����IZufCpJ�O�Q	�C��N��=�UG�aY�<E�� �=�)@���5Ѥ��`�2�������P �Ba�l<��7��	?�팔���k�����p8�9&��y<�#��|���Ò�В�
{/�0kW{�G�@%ax�X�g�� �����$�)��%x��w��A��l�W�}.������f��H�,�
>���o�}��F�S�Ĩ���kﴓ��Q�R}�j ��h�ȥ�	�S�o����$أ=�0����X��
"%��eY4�+�]�A�$,��b���o����7\�^� �D�]���{֟	��T� �,E&(19�X�U��2D/��]�mYQzl��J[�Y�-��Z�����{�`!�t#;�d3�grz��vm��񽃖��}
=
�c ��~zK��i��^�g@�d��k �E�U�Ԃ+����k��u�V���J��,*�\5"f 	��D>1W���~m�X����Z�P"��c��� �^�*ګ�4 {�ښI�iN��Ze�*�œZ&Cr�B�=u;�.����R���o�m�I�ӄ*�Ԍ�5wj�wǃ�`�3S�"�^���/Ϊ�SYr��r�M
J�����/c`�HF�IW����2)�1���ɋ(6j�B9S�#+�s����|��\�	>�\+��h�R4%1�j[�R��m{'d&���Լ��3|5CY+)�[1�� 8i|�h�&�R�D��-N6�G��2+��<��5�ǂ�'�,��*<��p��U(��u���8���
��f��V<>�Kq�%���;�(t�3��yM����K�����iV���_R\uO����$0F�C�B[+n������Dx#�����ʪ{�?�Q@ ���-L1���L��* 
�ښ9cI��	���dg��-6�Fr@���n�+����7�w�J�@`n�b��կ�����Eu���n�v��r����(f��ϖ� IX"�Ц���\��
�×���p?~�x�놿7��Bv�؎t�2�K�U��mZ��H�#a]s�h��}o�ƺ��q�å�gzf� �X3*�5V/�V�A��X�b�z{��F]��fG4���~?D�*d���'_b�[ ���o}~�������wܽ��}��sDN���8�5�ƚ>���L���1eu��"B��vt�]^Yqz��چ��Y�8 ���x����N/.T#)~8a�WVI�gU6��;|,ǝ���	���+O�@�f`�F��b�E0ušp��zI�39[�uu�Μ�D��w|�Q��O"}�Rj����"��{��C?��a��$?؏���7X6���P�P��]9♒yS���$:A;j��a�vZu�>�*8�x$��I�a�W���j3���]4F�`觎�s�V1��h�RA��F�����O!�4�Ԯz���P��X[4�ܲ��}y%��I� LY0S�����'��*ƜOF�z1�{�2�gՅ�y�Eg�#p<P�V�A@Z����Y&W}�K\Sk�d[�G:�4v�k�m)ͅ}��߭(�&���ҭ`_��P��줚Z��I��a�y6�d9���k���G����{9�!�*Q�`��'�¯�h�k���7w�DF�,���M�E�}��n���L��sE;��{kk�6���6����ͽ۷�u^��M @�����~��E8<�? ��ݢY�8ي�F��T�:,�1��k�"��k��(�U��ހ�s�~�-��V|�f.C^�>D�Vi�!2���e���+|���Y��X��E?��kG�L�����؍%����]�
?A�{
�����P_����2��/!ݱY�ʱ�e��iG�@xUI��
U.,��n�-�-5D�n�P�N\�\����u<5	y!�9�j
�_���1�}%l/'6���N�Lt	�=\���$�7�v��E�d& �8�'���-�OA�� �%���7v�����p�����E͉'���
�Ң3ӎ&����Mbd�b4N� ��z�P�G鈚�*�h�<_,�թmt�E�G��OPI���;��*��/{���?�^�t�����t      �	     x�u�=N1�k�)Rl��g��[EQD�4i���BH�� q.�@�  �E���(���y��J�c�c�#���V��F�"'@���X��	@Vq��c����Hܒ,�����#][��"I+C)r&�^%߱�����".�����z`D֊Y)����?�8��C�%b��|t���,�*�	��>�Ϧp�Pw1e��C)y��X��<V��<uR'�V�b�ơs�Y�'�w�j��|������6/���j�TU��Sfe     