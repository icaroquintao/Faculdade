#include <GL/gl.h>
#include <GL/glut.h>
#include <stdio.h>
#include <stdlib.h>
#include <iostream>
#include <fstream>
#include <math.h>
#include <time.h>


#define GIRO 10

// vertices, vertices normais, vertices de textura e faces
#include "CarregarArquivo.cpp" //biblioteca que carrega os .obj e os transforma em vetores
CarregarArquivo Batmovel, Roda1, Roda2, RodasTras; // variaveis referentes a cada obj que vc vai carregar

using namespace std;

void EspecificaParametrosVisualizacao(void);
void PosicionaObservador(void);

//variaveis de textura
GLubyte porta[256][256][3];
GLubyte parede[256][256][3];
GLubyte chao[256][256][3];
GLubyte carro[256][256][3];
GLubyte roda[256][256][3];
GLubyte bomba[256][256][3];
GLubyte coringa[256][256][3];

// letras servem para tratar as colisoes e sortear o final do labiinto
char matriz[9][9][2] = { { { 'S', 'd' }, { '*', '0' }, { '|', 'u' }, { '|', 'H' }, { '|', 'H' }, { '|', 'T' }, { '*', '0' }, { '|', 'L' }, { '|', 'n' } },
                         { { '|', 'J' }, { '|', 'T' }, { '*', '0' }, { '*', '0' }, { '*', '0' }, { '|', '+' }, { '|', 'H' }, { '|', '-' }, { '*', '0' } },
                         { { '*', '0' }, { '|', 'h' }, { '*', '0' }, { '|', 'L' }, { '|', 'H' }, { '|', '-' }, { '*', '0' }, { '|', 'J' }, { '|', 'l' } },
                         { { '|', 'L' }, { '|', '|' }, { '|', 'H' }, { '|', '-' }, { '*', '0' }, { '|', 'J' }, { '|', 'l' }, { '*', '0' }, { '|', 'h' } },
                         { { '|', 'c' }, { '*', '0' }, { '*', '0' }, { '|', 'h' }, { '*', '0' }, { '*', '0' }, { '|', 'c' }, { '*', '0' }, { '|', 'h' } },
                         { { '*', '0' }, { '|', 'd' }, { '*', '0' }, { '|', '+' }, { '|', 'H' }, { '|', 'l' }, { '*', '0' }, { '|', 'u' }, { '|', '-' } },
                         { { '|', 'L' }, { '|', '|' }, { '|', 'H' }, { '|', '-' }, { '*', '0' }, { '|', '+' }, { '|', 'n' }, { '*', '0' }, { '|', 'h' } },
                         { { '|', 'h' }, { '*', '0' }, { '*', '0' }, { '|', 'h' }, { '*', '0' }, { '|', 'c' }, { '*', '0' }, { '|', 'u' }, { '|', 'j' } },
                         { { '|', 'c' }, { '*', '0' }, { '|', 'u' }, { '|', '|' }, { '|', 'n' }, { '*', '0' }, { '*', '0' }, { '*', '0' }, { '*', '0' } } };


// Armazena identifica??o da textura
GLuint textura_parede, textura_chao, textura_porta, textura_carro, textura_bomba, textura_roda, textura_coringa;

GLfloat angle, fAspect;

int direcao = 0, angloDrone = 0, ant = 0, fim = 1, chave = 0, gira =  0;
float movX = 0, movZ = 0;

GLfloat offset[3] = { 50,10,0};  //altera a posição do observador (1º distancia 2º altura 3º angulatura)
//(3ª 50,10,0 | 1ª 20,0,0 | front -80,10,0 | Side E 2, 20, 45 | Side D 2, 20, -45 )
GLfloat objectPosition[3] = { movX, 0, movZ };
GLfloat cameraPosition[3];

float ConverteAng(int anglo)
{
    return M_PI * anglo / 180.0f; // tranforma graus em radianos
}

void DefineIluminacao(void)
{
    GLfloat luzAmbiente[4] = { 0.2, 0.2, 0.2, 1.0 };
    GLfloat luzDifusa[4] = { 0.7, 0.7, 0.7, 1.0 }; // "cor"
    GLfloat luzEspecular[4] = { 1.0, 1.0, 1.0, 1.0 }; // "brilho"
    GLfloat posicaoLuz[4] = { 0.0, 50.0, 50.0, 1.0 };

// Capacidade de brilho do material
    GLfloat especularidade[4] = { 1.0, 1.0, 1.0, 1.0 };
    GLint especMaterial = 60;

// Define a reflet?ncia do material
    glMaterialfv(GL_FRONT, GL_SPECULAR, especularidade);

// Define a concentra??o do brilho
    glMateriali(GL_FRONT, GL_SHININESS, especMaterial);

// Ativa o uso da luz ambiente
    glLightModelfv(GL_LIGHT_MODEL_AMBIENT, luzAmbiente);

// Define os par?metros da luz de n?mero 0
    glLightfv(GL_LIGHT0, GL_AMBIENT, luzAmbiente);
    glLightfv(GL_LIGHT0, GL_DIFFUSE, luzDifusa);
    glLightfv(GL_LIGHT0, GL_SPECULAR, luzEspecular);
    glLightfv(GL_LIGHT0, GL_POSITION, posicaoLuz);
}

void cuboMenor(GLuint textura_quad)// cria o coringa e a bomba
{
    glPushMatrix();

    glTranslated(-816, -40, -190);
    glScaled(0.1, 0.3, 0.1);
    glEnable(GL_TEXTURE_2D);
    glBindTexture(GL_TEXTURE_2D, textura_coringa);
    // Desenha um cubo

    // gltex é o mapeamento da textura glvertex é um ponto do objeto
    glBegin(GL_POLYGON); // Face frontal
    glNormal3f(0, 0, -1); // Normal da face
    glTexCoord2f(1, 1);
    glVertex3f(50.0, 50.0, -50.0);
    glTexCoord2f(1, 0);
    glVertex3f(50.0, -50.0, -50.0);
    glTexCoord2f(0, 0);
    glVertex3f(-50.0, -50.0, -50.0);
    glTexCoord2f(0, 1);
    glVertex3f(-50.0, 50.0, -50.0);
    glEnd();


    glPopMatrix();
    glDisable(GL_TEXTURE_2D);
    glPushMatrix();
    glTranslated(-800, -40, -190);
    glScaled(0.08, 0.08, 0.08);
    glEnable(GL_TEXTURE_2D);
    glBindTexture(GL_TEXTURE_2D, textura_quad);
    // Desenha um cubo

    glBegin(GL_POLYGON); // Face frontal
    glNormal3f(0, 0, -1); // Normal da face
    glTexCoord2f(1, 1);
    glVertex3f(50.0, 50.0, -50.0);
    glTexCoord2f(1, 0);
    glVertex3f(50.0, -50.0, -50.0);
    glTexCoord2f(0, 0);
    glVertex3f(-50.0, -50.0, -50.0);
    glTexCoord2f(0, 1);
    glVertex3f(-50.0, 50.0, -50.0);
    glEnd();



    glPopMatrix();
    glDisable(GL_TEXTURE_2D);
}

void desenha_quadrado(GLfloat x)
{
    glBegin(GL_QUADS);
    glVertex2f(x, x);
    glVertex2f( x, -x);
    glVertex2f(-x, -x);
    glVertex2f(-x, x);
    glEnd();
}

void carregaMinimapa()
{
    glPushMatrix();

    glMatrixMode(GL_PROJECTION);
    //Substitue a matriz atual pela matriz de identidade
    glLoadIdentity();
    // Estabelece a janela de seleção (left, right, bottom, top) espaçamento entre cada quadrado do minimapa
    gluOrtho2D(-1, 1, -1, 1);


    glMatrixMode(GL_MODELVIEW);
    glLoadIdentity();

    float t = 20;

        glViewport(0,180,180,20);//cordenadas de onde vai ficar (x, y), proporção (Xi,Yi) janela onde vai estar escrito Minimapa
        glColor3f(1.0f, 1.0f, 1.0f);// cor da letra
        glRasterPos3f(-0.5, 0, 0);// centralizei o escito no eixo X
        char e[9] = { 'M', 'i', 'n', 'i',' ','M','a','p','a'};
        for(int q = 0; q < 9; q++)
            glutBitmapCharacter(GLUT_BITMAP_HELVETICA_18, e[q]);// modelo da letra GLUT_BITMAP_TIMES_ROMAN_24

    for(int i = 0; i < 9; i++)
        for(int j = 0; j < 9; j++)
        {
            glViewport((t * j) , (t * i) , 20, 20);

            if(matriz[i][j][0] == '|')
            {
                glColor3f(1.0, 1.0, 1.0);
                desenha_quadrado(25);
            }
            else if(matriz[i][j][0] == 'S')
            {
                glColor3f(1, 0, 0);
                desenha_quadrado(25);
            }
            else
            {
                glColor3f(0, 0, 0);
                desenha_quadrado(25);
            }
        }
    glPopMatrix();
}


void DesenhaCarro()
{


    glScaled(.8,.8,.8); //x(comprimento),y(altura),Z(largura)
    glScalef( 50, 50, 50);
    glTranslated(-movX/8, -1.1, -movZ/8);// tranladar em função das minhas teclas de andar para frante e andar para tras
    glRotated(angloDrone, 0, 1, 0);// rotacionar em função das teclas para os lados
    glTranslated(0.2,0,0);
    glPushMatrix();
    glRotated(270,0,1,0);



    // Desenha um batmovel



    for ( int j = 0; j < (Batmovel.faces).size(); ++j )
    {
        glEnable(GL_TEXTURE_2D);
        glBindTexture(GL_TEXTURE_2D, textura_carro);
        glBegin ( GL_POLYGON );

        for (int i = 0; i < (Batmovel.faces[j]).size() ; ++i )
        {

            //cada vertice tem a face a qual ele pertence
            GLfloat vert[3] = {(Batmovel.vertices1[Batmovel.faces[j][i][0]][0]),(Batmovel.vertices1[Batmovel.faces[j][i][0]][1]),(Batmovel.vertices1[Batmovel.faces[j][i][0]][2])};
            GLfloat nor[3] = {Batmovel.normais[Batmovel.faces[j][i][2]][0],Batmovel.normais[Batmovel.faces[j][i][2]][1],Batmovel.normais[Batmovel.faces[j][i][2]][2]};
            glNormal3fv ( nor);
            glVertex3fv ( vert );
            GLfloat textura[2] = { Batmovel.texturas[Batmovel.faces[j][i][1]][0], Batmovel.texturas[Batmovel.faces[j][i][1]][1] };
            glTexCoord2fv(textura);

        }

        glEnd( );
        glDisable(GL_TEXTURE_2D);
    }
    glPopMatrix();
    glPushMatrix();
    glTranslated(-0.75,0.17,0.01);
    glScaled( 1.6, 1, 1.81);
    glRotated(90,0,1,0);
    glRotated(gira,1,0,0);

    for ( int j = 0; j < (Roda1.faces).size(); ++j )
    {

        glEnable(GL_TEXTURE_2D);
        glBindTexture(GL_TEXTURE_2D, textura_roda);
        glBegin ( GL_POLYGON );

        for (int i = 0; i < (Roda1.faces[j]).size() ; ++i )
        {

            GLfloat vert[3] = {(Roda1.vertices1[Roda1.faces[j][i][0]][0]),(Roda1.vertices1[Roda1.faces[j][i][0]][1]),(Roda1.vertices1[Roda1.faces[j][i][0]][2])};
            GLfloat nor[3] = {Roda1.normais[Roda1.faces[j][i][2]][0],Roda1.normais[Roda1.faces[j][i][2]][1],Roda1.normais[Roda1.faces[j][i][2]][2]};
            glNormal3fv ( nor);
            glVertex3fv ( vert );
            GLfloat textura[2] = { Roda1.texturas[Roda1.faces[j][i][1]][0], Roda1.texturas[Roda1.faces[j][i][1]][1] };
            glTexCoord2fv(textura);



        }

        glEnd( );
        glDisable(GL_TEXTURE_2D);
    }

    glPopMatrix();
    glPushMatrix();
    glTranslated(- 0.75,0.17, 0.31);
    glScaled( 1.6, 1, 1.81);
    glRotated(90,0,1,0);
    glRotated(gira,1,0,0);

    for ( int j = 0; j < (Roda2.faces).size(); ++j )
    {

        glEnable(GL_TEXTURE_2D);
        glBindTexture(GL_TEXTURE_2D, textura_roda);
        glBegin ( GL_POLYGON );

        for (int i = 0; i < (Roda2.faces[j]).size() ; ++i )
        {

            GLfloat vert[3] = {(Roda2.vertices1[Roda2.faces[j][i][0]][0]),(Roda2.vertices1[Roda2.faces[j][i][0]][1]),(Roda2.vertices1[Roda2.faces[j][i][0]][2])};
            GLfloat nor[3] = {Roda2.normais[Roda2.faces[j][i][2]][0],Roda2.normais[Roda2.faces[j][i][2]][1],Roda2.normais[Roda2.faces[j][i][2]][2]};
            glNormal3fv ( nor);
            glVertex3fv ( vert );
            GLfloat textura[2] = { Roda2.texturas[Roda2.faces[j][i][1]][0], Roda2.texturas[Roda2.faces[j][i][1]][1] };
            glTexCoord2fv(textura);


        }

        glEnd( );
        glDisable(GL_TEXTURE_2D);
    }
    glPopMatrix();
    glPushMatrix();
    glTranslated(0,0.2,0);
    glRotated(270,0,1,0);
    glRotated(gira,1,0,0);

    for ( int j = 0; j < (RodasTras.faces).size(); ++j )
    {

        glEnable(GL_TEXTURE_2D);
        glBindTexture(GL_TEXTURE_2D, textura_roda);
        glBegin ( GL_POLYGON );

        for (int i = 0; i < (RodasTras.faces[j]).size() ; ++i )
        {

            GLfloat vert[3] = {(RodasTras.vertices1[RodasTras.faces[j][i][0]][0]),(RodasTras.vertices1[RodasTras.faces[j][i][0]][1]),(RodasTras.vertices1[RodasTras.faces[j][i][0]][2])};
            GLfloat nor[3] = {RodasTras.normais[RodasTras.faces[j][i][2]][0],RodasTras.normais[RodasTras.faces[j][i][2]][1],RodasTras.normais[RodasTras.faces[j][i][2]][2]};
            glNormal3fv ( nor);
            glVertex3fv ( vert );
            GLfloat textura[2] = { RodasTras.texturas[RodasTras.faces[j][i][1]][0], RodasTras.texturas[RodasTras.faces[j][i][1]][1] };
            glTexCoord2fv(textura);

        }

        glEnd( );
        glDisable(GL_TEXTURE_2D);
    }
    glPopMatrix();


}

// Função callback chamada para fazer o desenho

void desenha_face_dir(int i, int j, GLuint textura)
{
    glPushMatrix();
//    glScaled(0.5, 0.5, 0.5);
    glTranslatef((-100) * i, 0, j * (-100));
    glBindTexture(GL_TEXTURE_2D, textura);
    glBegin(GL_POLYGON); // Face lateral direita
    glNormal3f(1, 0, 0); // Normal da face
    glTexCoord2f(0, 1); // mapear textura
    glVertex3f(50.0, 50.0, 50.0);
    glTexCoord2f(0, 0);
    glVertex3f(50.0, -50.0, 50.0);
    glTexCoord2f(1, 0);
    glVertex3f(50.0, -50.0, -50.0);
    glTexCoord2f(1, 1);
    glVertex3f(50.0, 50.0, -50.0);
    glEnd();
    glPopMatrix();
}

void desenha_face_esq(int i, int j, GLuint textura)
{
    glPushMatrix();
    glTranslatef((-100) * i, 0, j * (-100));
    glBindTexture(GL_TEXTURE_2D, textura);
    glBegin(GL_POLYGON); // Face lateral esquerda
    glNormal3f(-1, 0, 0); // Normal da face
    glTexCoord2f(0, 1);
    glVertex3f(-50.0, 50.0, 50.0);
    glTexCoord2f(1, 1);
    glVertex3f(-50.0, 50.0, -50.0);
    glTexCoord2f(1, 0);
    glVertex3f(-50.0, -50.0, -50.0);
    glTexCoord2f(0, 0);
    glVertex3f(-50.0, -50.0, 50.0);
    glEnd();
    glPopMatrix();
}

void desenha_face_up(int i, int j, GLuint textura)
{
    glPushMatrix();
    glTranslatef((-100) * i, 0, j * (-100));
    glBindTexture(GL_TEXTURE_2D, textura);
    glBegin(GL_POLYGON); // Face frontal
    glNormal3f(0, 0, -1); // Normal da face
    glTexCoord2f(1, 1);
    glVertex3f(50.0, 50.0, -50.0);
    glTexCoord2f(1, 0);
    glVertex3f(50.0, -50.0, -50.0);
    glTexCoord2f(0, 0);
    glVertex3f(-50.0, -50.0, -50.0);
    glTexCoord2f(0, 1);
    glVertex3f(-50.0, 50.0, -50.0);
    glEnd();
    glPopMatrix();
}

void desenha_face_down(int i, int j, GLuint textura)
{
    glPushMatrix();
    glTranslatef((-100) * i, 0, j * (-100));
    glBindTexture(GL_TEXTURE_2D, textura);
    glBegin(GL_POLYGON); // Face posterior
    glNormal3f(0, 0, 1); // Normal da face
    glTexCoord2f(0, 1);
    glVertex3f(50.0, 50.0, 50.0);
    glTexCoord2f(1, 1);
    glVertex3f(-50.0, 50.0, 50.0);
    glTexCoord2f(1, 0);
    glVertex3f(-50.0, -50.0, 50.0);
    glTexCoord2f(0, 0);
    glVertex3f(50.0, -50.0, 50.0);
    glEnd();
    glPopMatrix();
}

void desenha_face_chao(int i, int j, GLuint textura)
{
    glPushMatrix();
    glTranslatef((-100) * i, 0, j * (-100));
    glBindTexture(GL_TEXTURE_2D, textura);
    glBegin(GL_POLYGON); // Face inferior
    glNormal3f(0, -1, 0); // Normal da face
    glTexCoord2f(0, 1);
    glVertex3f(-50.0, -50.0, -50.0);
    glTexCoord2f(1, 1);
    glVertex3f(50.0, -50.0, -50.0);
    glTexCoord2f(1, 0);
    glVertex3f(50.0, -50.0, 50.0);
    glTexCoord2f(0, 0);
    glVertex3f(-50.0, -50.0, 50.0);
    glEnd();
    glPopMatrix();
}

void carregaMapa()
{
    glPushMatrix();
    glEnable(GL_TEXTURE_2D);
    for(int i = 0; i < 9; i++)
        for(int j = 0; j < 9; j++)
        {
            if(matriz[i][j][0] != '*')
            {
                desenha_face_chao(i, j, textura_chao);
            }

            if(matriz[i][j][1] == 'n')
            {
                if(matriz[i][j][0] == 'F')
                    desenha_face_dir(i, j, textura_porta);
                else
                    desenha_face_dir(i, j, textura_parede);
                    desenha_face_esq(i, j, textura_parede);
                    desenha_face_up(i, j, textura_parede);
            }
            else if(matriz[i][j][1] == 'J')
            {
                if(matriz[i][j][0] == 'F')
                    desenha_face_esq(i, j, textura_porta);
                else
                    desenha_face_esq(i, j, textura_parede);
                    desenha_face_down(i, j, textura_parede);
            }
            else if(matriz[i][j][1] == 'T')
            {
                if(matriz[i][j][0] == 'F')
                    desenha_face_dir(i, j, textura_porta);
                else
                    desenha_face_dir(i, j, textura_parede);
                    desenha_face_up(i, j, textura_parede);
            }
            else if(matriz[i][j][1] == 'L')
            {
                if(matriz[i][j][0] == 'F')
                    desenha_face_dir(i, j, textura_porta);
                else
                    desenha_face_dir(i, j, textura_parede);
                    desenha_face_down(i, j, textura_parede);
            }
            else if(matriz[i][j][1] == '_')
            {
                if(matriz[i][j][0] == 'F')
                    desenha_face_dir(i, j, textura_porta);
                else
                    desenha_face_dir(i, j, textura_parede);
            }
            else if(matriz[i][j][1] == 'H')
            {
                if(matriz[i][j][0] == 'F')
                    desenha_face_dir(i, j, textura_porta);
                else
                    desenha_face_dir(i, j, textura_parede);
                    desenha_face_esq(i, j, textura_parede);
            }
            else if(matriz[i][j][1] == 'd')
            {
                if(matriz[i][j][0] == 'F')
                    desenha_face_dir(i, j, textura_porta);
                else
                    desenha_face_dir(i, j, textura_parede);
                    desenha_face_down(i, j, textura_parede);
                    desenha_face_up(i, j, textura_parede);
            }
            else if(matriz[i][j][1] == 'c')
            {
                if(matriz[i][j][0] == 'F')
                    desenha_face_esq(i, j, textura_porta);
                else
                    desenha_face_esq(i, j, textura_parede);
                    desenha_face_down(i, j, textura_parede);
                    desenha_face_up(i, j, textura_parede);
            }
            else if(matriz[i][j][1] == 'u')
            {
                if(matriz[i][j][0] == 'F')
                    desenha_face_dir(i, j, textura_porta);
                else
                    desenha_face_dir(i, j, textura_parede);
                    desenha_face_esq(i, j, textura_parede);
                    desenha_face_down(i, j, textura_parede);
            }
            else if(matriz[i][j][1] == '-')
            {
                if(matriz[i][j][0] == 'F')
                    desenha_face_up(i, j, textura_porta);
                else
                    desenha_face_up(i, j, textura_parede);
            }
            else if(matriz[i][j][1] == '+')
            {
                if(matriz[i][j][0] == 'F')
                    desenha_face_down(i, j, textura_porta);
                else
                    desenha_face_down(i, j, textura_parede);
            }
            else if(matriz[i][j][1] == '|')
            {
                if(matriz[i][j][0] == 'F')
                    desenha_face_esq(i, j, textura_porta);
                else
                    desenha_face_esq(i, j, textura_parede);
            }
            else if(matriz[i][j][1] == 'j')
            {
                if(matriz[i][j][0] == 'F')
                    desenha_face_up(i, j, textura_porta);
                else
                    desenha_face_up(i, j, textura_parede);
                    desenha_face_esq(i, j, textura_parede);
            }
            else if(matriz[i][j][1] == 'l')
            {
                if(matriz[i][j][0] == 'F')
                    desenha_face_dir(i, j, textura_porta);
                else
                    desenha_face_dir(i, j, textura_parede);
                    desenha_face_up(i, j, textura_parede);
            }
            else if(matriz[i][j][1] == 'h')
            {
                if(matriz[i][j][0] == 'F')
                    desenha_face_up(i, j, textura_porta);
                else
                    desenha_face_up(i, j, textura_parede);
                    desenha_face_down(i, j, textura_parede);
            }
        }
    glDisable(GL_TEXTURE_2D);
    glPopMatrix();
}

// Fun??o callback chamada para fazer o desenho
void Desenha(void)
{
    EspecificaParametrosVisualizacao();

    if(fim == 0)
    {

        glViewport(0, 0, 900, 600);// define o tamanho da minha janela

        // posicionando o meu objeto no inicio
        objectPosition[0] = 0;
        objectPosition[1] = 0;
        objectPosition[2] = 0;

        offset[0] = 0;
        offset[0] = 0;
        offset[0] = 0;

        PosicionaObservador();

        glClearColor(1.0f, 1.0f, 1.0f, 1.0f);// cor do fundo
        glClear(GL_COLOR_BUFFER_BIT);

        glColor3f(0.0f, 0.0f, 0.0f);// cor da letra
        glRasterPos3f(0, 0, 0);
        char e[22] = { 'V', 'o', 'c', 'e', ' ', 'S', 'a', 'l', 'v', 'o', 'u', ' ', 'a',' ', 'C', 'i', 'd', 'a', 'd', 'e', ' ', '!' };
        for(int q = 0; q < 22; q++)
            glutBitmapCharacter(GLUT_BITMAP_HELVETICA_18, e[q]);
    }
    else
    {
        glViewport(0, 0, 1350, 700);

        // Limpa a janela de visualiza
        glClear(GL_COLOR_BUFFER_BIT | GL_DEPTH_BUFFER_BIT);

        carregaMapa();

        if(chave == 0)// o personagem não pegou a chave ainda logo ele tem que estar pintado de bomba
            cuboMenor(textura_bomba);

        DesenhaCarro();
       carregaMinimapa();


    }

    // Execução dos comandos de desenho
    glutSwapBuffers();
}

void inicializaMatriz()
{
    int x, y;

    srand((unsigned) time(NULL));

    while(1)
    {
        x = rand() % 9;
        y = rand() % 9;

        if(matriz[x][y][0] == '|')
        {
            if(y > 3 && x > 3)// para nãoo ficar muito perto do inicio
            {
                matriz[x][y][0] = 'F';
                break;
            }
        }
    }

    printf("\n Meu Mapa \n");
    for(int i =8; i >= 0; i--)
    {
        for(int j = 8; j >= 0; j--)
            printf("%c", matriz[i][j][0]);
            printf("\n");
    }
    printf("\n\n");

}

// Inicializa
void Inicializa(void)
{
// Define a cor de fundo da janela de visualiza??o
    glClearColor(0.0f, 0.1f, 0.2f, .0f);

// Habilita a defini??o da cor do material a partir da cor corrente
    glEnable(GL_COLOR_MATERIAL);

//Habilita o uso de ilumina??o
   // glEnable(GL_LIGHTING);

// Habilita a luz de n?mero 0
  //  glEnable(GL_LIGHT0);

// Habilita o depth-buffering
    glEnable(GL_DEPTH_TEST);

// Inicializa a vari?vel que especifica o ?ngulo da proje??o
// perspectiva
    angle = 30;// define a camera 1(40 ou 50) ou 3(80) pessoa
// Inicializa as vari?veis usadas para alterar a posi??o do
// observador virtual

    inicializaMatriz();

    Batmovel.Carregar("Batmovel.OBJ");
    Roda1.Carregar("Roda1.OBJ");
    Roda2.Carregar("Roda2.OBJ");
    RodasTras.Carregar("RodasTras.OBJ");//carrega o arquivo

    cameraPosition[0] = objectPosition[0] + offset[0];
    cameraPosition[1] = objectPosition[1] + offset[1];
    cameraPosition[2] = objectPosition[2] + offset[2];

    try
    {
        ifstream arq("porta2.bmp", ios::binary);
        char c;
        if(!arq)
            cout << "Erro abriu";

        for(int i = 0; i < 50; i++)
            c = arq.get();// percorre e retira o referente ao cabeçalho

        for(int i = 0; i < 256; i++)
            for(int j = 0; j < 256; j++)
            {
                //leitura dosw pixels em x y z
                c = arq.get();
                porta[i][j][0] = c;
                c = arq.get();
                porta[i][j][2] = c;
                c = arq.get();
                porta[i][j][1] = c;
            }

        arq.close();
        arq.clear();

        ifstream arq2("parede.bmp", ios::binary);

        if(!arq2)
            cout << "Erro abriu";

        for(int i = 0; i < 50; i++)
            c = arq2.get();// percorre e retira o referente ao cabeçalho

        for(int i = 0; i < 256; i++)
            for(int j = 0; j < 256; j++)
            {
                //leitura dos pixels em x y z
                c = arq2.get();
                parede[i][j][0] = c;
                c = arq2.get();
                parede[i][j][2] = c;
                c = arq2.get();
                parede[i][j][1] = c;
            }

        arq2.close();
        arq2.clear();

        ifstream arq3("chao.bmp", ios::binary);

        if(!arq3)
            cout << "Erro abriu";

        for(int i = 0; i < 50; i++)
            c = arq3.get();
        for(int i = 0; i < 256; i++)
            for(int j = 0; j < 256; j++)
            {
                c = arq3.get();
                chao[i][j][0] = c;
                c = arq3.get();
                chao[i][j][2] = c;
                c = arq3.get();
                chao[i][j][1] = c;
            }

        arq3.close();
        arq3.clear();

        ifstream arq4("carro.bmp", ios::binary);

        if(!arq4)
            cout << "Erro abriu";

        for(int i = 0; i < 50; i++)
            c = arq4.get();
        for(int i = 0; i < 256; i++)
            for(int j = 0; j < 256; j++)
            {
                c = arq4.get();
                carro[i][j][0] = c;
                c = arq4.get();
                carro[i][j][2] = c;
                c = arq4.get();
                carro[i][j][1] = c;
            }

        arq4.close();
        arq4.clear();



        ifstream arq5("bomba.bmp", ios::binary);

        if(!arq5)
            cout << "Erro abriu";

        for(int i = 0; i < 30; i++)
            c = arq5.get();
        for(int i = 0; i < 256; i++)
            for(int j = 0; j < 256; j++)
            {
                c = arq5.get();
                bomba[i][j][2] = c;
                c = arq5.get();
                bomba[i][j][1] = c;
                c = arq5.get();
                bomba[i][j][0] = c;
            }

        arq5.close();
        arq5.clear();

        ifstream arq7("coringa.bmp", ios::binary);

        if(!arq7)
            cout << "Erro abriu";

        for(int i = 0; i < 122; i++)
            c = arq7.get();
        for(int i = 0; i < 256; i++)
            for(int j = 0; j < 256; j++)
            {
                c = arq7.get();
                coringa[i][j][2] = c;
                c = arq7.get();
                coringa[i][j][1] = c;
                c = arq7.get();
                coringa[i][j][0] = c;
            }

        ifstream arq8("roda.bmp", ios::binary);

        if(!arq8)
            cout << "Erro abriu";

        for(int i = 0; i < 50; i++)
            c = arq8.get();
        for(int i = 0; i < 256; i++)
            for(int j = 0; j < 256; j++)
            {
                c = arq8.get();
                roda[i][j][0] = c;
                c = arq8.get();
                roda[i][j][2] = c;
                c = arq8.get();
                roda[i][j][1] = c;
            }

        arq8.close();
        arq8.clear();


    }
    catch(...)
    {
        cout << "Erro ao ler imagem" << endl;
    }

    // chao
    glGenTextures(1, &textura_chao);

    // Associa a textura aos comandos seguintes
    glBindTexture(GL_TEXTURE_2D, textura_chao);

    // Envia a textura para uso pela OpenGL com x,y e z em uma grade 256 X 256 localizzada em chao
    glTexImage2D(GL_TEXTURE_2D, 0, 3, 256, 256, 0, GL_RGB, GL_UNSIGNED_BYTE, chao);

    // Define os filtros de magnifica??o e minifica??o
    glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_MAG_FILTER, GL_NEAREST);
    glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_MIN_FILTER, GL_NEAREST);

    // Seleciona o modo de aplica??o da textura
    glTexEnvi(GL_TEXTURE_ENV, GL_TEXTURE_ENV_MODE, GL_REPLACE);


    // roda
    glGenTextures(1, &textura_roda);

    // Associa a textura aos comandos seguintes
    glBindTexture(GL_TEXTURE_2D, textura_roda);

    // Envia a textura para uso pela OpenGL,
    glTexImage2D(GL_TEXTURE_2D, 0, 3, 256, 256, 0, GL_RGB, GL_UNSIGNED_BYTE, roda);

    // Define os filtros de magnifica??o e minifica??o
    glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_MAG_FILTER, GL_NEAREST);
    glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_MIN_FILTER, GL_NEAREST);

    // Seleciona o modo de aplica??o da textura
    glTexEnvi(GL_TEXTURE_ENV, GL_TEXTURE_ENV_MODE, GL_REPLACE);


    // carro
    glGenTextures(1, &textura_carro);

    // Associa a textura aos comandos seguintes
    glBindTexture(GL_TEXTURE_2D, textura_carro);

    // Envia a textura para uso pela OpenGL
    glTexImage2D(GL_TEXTURE_2D, 0, 3, 256, 256, 0, GL_RGB, GL_UNSIGNED_BYTE, carro);

    // Define os filtros de magnifica??o e minifica??o
    glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_MAG_FILTER, GL_NEAREST);
    glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_MIN_FILTER, GL_NEAREST);

    // Seleciona o modo de aplica??o da textura
    glTexEnvi(GL_TEXTURE_ENV, GL_TEXTURE_ENV_MODE, GL_REPLACE);



    // porta
    glGenTextures(1, &textura_porta);

    // Associa a textura aos comandos seguintes
    glBindTexture(GL_TEXTURE_2D, textura_porta);

    // Envia a textura para uso pela OpenGL
    glTexImage2D(GL_TEXTURE_2D, 0, 3, 256, 256, 0, GL_RGB, GL_UNSIGNED_BYTE, porta);

    // Define os filtros de magnifica??o e minifica??o
    glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_MAG_FILTER, GL_NEAREST);
    glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_MIN_FILTER, GL_NEAREST);

    // Seleciona o modo de aplica??o da textura
    glTexEnvi(GL_TEXTURE_ENV, GL_TEXTURE_ENV_MODE, GL_REPLACE);

    // parede
    glGenTextures(1, &textura_parede);

    // Associa a textura aos comandos seguintes
    glBindTexture(GL_TEXTURE_2D, textura_parede);

    // Envia a textura para uso pela OpenGL
    glTexImage2D(GL_TEXTURE_2D, 0, 3, 256, 256, 0, GL_RGB, GL_UNSIGNED_BYTE, parede);

    // Define os filtros de magnifica??o e minifica??o
    glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_MAG_FILTER, GL_NEAREST);
    glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_MIN_FILTER, GL_NEAREST);

    // Seleciona o modo de aplica??o da textura
    glTexEnvi(GL_TEXTURE_ENV, GL_TEXTURE_ENV_MODE, GL_REPLACE);

    // bomba
    glGenTextures(1, &textura_bomba);

    // Associa a textura aos comandos seguintes
    glBindTexture(GL_TEXTURE_2D, textura_bomba);

    // Envia a textura para uso pela OpenGL
    glTexImage2D(GL_TEXTURE_2D, 0, 3, 256, 256, 0, GL_RGB, GL_UNSIGNED_BYTE, bomba);

    // Define os filtros de magnifica??o e minifica??o
    glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_MAG_FILTER, GL_NEAREST);
    glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_MIN_FILTER, GL_NEAREST);

    // Seleciona o modo de aplica??o da textura
    glTexEnvi(GL_TEXTURE_ENV, GL_TEXTURE_ENV_MODE, GL_REPLACE);


    // coringa
    glGenTextures(1, &textura_coringa);

    // Associa a textura aos comandos seguintes
    glBindTexture(GL_TEXTURE_2D, textura_coringa);

    // Envia a textura para uso pela OpenGL
    glTexImage2D(GL_TEXTURE_2D, 0, 3, 256, 256, 0, GL_RGB, GL_UNSIGNED_BYTE, coringa);

    // Define os filtros de magnifica??o e minifica??o
    glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_MAG_FILTER, GL_NEAREST);
    glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_MIN_FILTER, GL_NEAREST);

    // Seleciona o modo de aplica??o da textura
    glTexEnvi(GL_TEXTURE_ENV, GL_TEXTURE_ENV_MODE, GL_REPLACE);
}

// Fun??o usada para especificar a posi??o do observador virtual
void PosicionaObservador(void)
{
    // Especifica sistema de coordenadas do modelo

    glMatrixMode(GL_MODELVIEW);
    // Inicializa sistema de coordenadas do modelo
    glLoadIdentity();

    // Especifica posi??o do observador e do alvo

    cameraPosition[0] = objectPosition[0] + offset[0];
    cameraPosition[1] = objectPosition[1] + offset[1];
    cameraPosition[2] = objectPosition[2] + offset[2];

    //como o observador ira olhar, o que ele vai olhar, e de que forma
    gluLookAt(cameraPosition[0], cameraPosition[1], cameraPosition[2], objectPosition[0], objectPosition[1], objectPosition[2], 0, 1, 0);

    //DefineIluminacao();
}

// Fun??o usada para especificar o volume de visualiza??o
void EspecificaParametrosVisualizacao(void)
{
    // Especifica sistema de coordenadas de proje??o
    glMatrixMode(GL_PROJECTION);
    // Inicializa sistema de coordenadas de proje??o
    glLoadIdentity();

    // Especifica a proje??o perspectiva(angulo,aspecto,zMin,zMax)
    gluPerspective(angle, fAspect , 0.1 , 900);
//angulo = o quanto ele vai conseguir ver, faspect = porção da tela que vai conseguir ver zmin,zmax = o quando vc vera a sua frente

    PosicionaObservador();
}

// Fun??o callback chamada quando o tamanho da janela ? alterado
void AlteraTamanhoJanela(GLsizei w, GLsizei h)
{
    // Para previnir uma divis?o por zero
    if(h == 0)
        h = 1;

    // Especifica as dimens?es da viewport
    glViewport(0, 0, w, h);

    // Calcula a corre??o de aspecto
    fAspect = (GLfloat) w / (GLfloat) h;

    EspecificaParametrosVisualizacao();
}

void verificaChave()
{
    if(chave == 0 && movX >= 160 && movX <= 165 && movZ >= 36 && movZ <= 40)
    {
        chave = 1;
    }
}

// Fun??o callback chamada para gerenciar eventos de teclas especiais (F1,PgDn,...)
void TeclasEspeciais(int tecla, int x, int y)
{
    if(fim == 1)
    {
        int xx, yy, x0, y0;

        switch (tecla)
        {
        case GLUT_KEY_LEFT:
            angloDrone = angloDrone + GIRO;

            if(angloDrone == 360)
                angloDrone = 0;

            offset[2] = 50 * (sin(ConverteAng(-angloDrone)));
            offset[0] = 50 * (cos(ConverteAng(-angloDrone)));

            break;
        case GLUT_KEY_RIGHT:
            angloDrone = angloDrone - GIRO;

            if(angloDrone <= -360)
                angloDrone = 0;

            offset[2] = 50 * (sin(ConverteAng(-angloDrone)));
            offset[0] = 50 * (cos(ConverteAng(-angloDrone)));

            break;
        case GLUT_KEY_UP: //se for reto
            x0 = trunc((movX + 11) / 20);
            y0 = trunc((movZ + 11) / 20);

            xx = trunc((movX + 11 + (cos(ConverteAng(-angloDrone)))) / 20);
            yy = trunc((movZ + 11 + (sin(ConverteAng(-angloDrone)))) / 20);

            //faz a roda girar
            if(gira <10)
            {
                gira += 3;
            }
            else
                gira = 0;
            // fim roda gira

          if(angloDrone == 0)
            {
                if(chave != 0)
                {
                    if(matriz[xx][yy][0] == 'F')
                    {
                        movX = movX + (cos(ConverteAng(-angloDrone)));
                        movZ = movZ + (sin(ConverteAng(-angloDrone)));
                        objectPosition[0] = objectPosition[0] - 5 * (cos(ConverteAng(-angloDrone)));
                        objectPosition[2] = objectPosition[2] - 5 * (sin(ConverteAng(-angloDrone)));

                        if(movX >= xx * 20 + 9)
                            fim = 0;
                        break;
                    }
                }
                else if(matriz[xx][yy][1] == 'n' || matriz[xx][yy][1] == 'J' || matriz[xx][yy][1] == 'H' || matriz[xx][yy][1] == 'c' || matriz[xx][yy][1] == 'u' || matriz[xx][yy][1] == '|' || matriz[xx][yy][1] == 'j')
                {
                    if(xx == 0)
                    {
                        if(movX + cos(ConverteAng(angloDrone)) >= 6)
                        {
                            break;
                        }
                    }
                    else if(movX + cos(ConverteAng(angloDrone)) >= (xx * 20 + 3))
                    {
                        break;
                    }
                }
            }
            else if(angloDrone == 180 || angloDrone == -180)
            {
                if(chave != 0)
                {
                    // verifico se a posição é valida para alterar a posição do objeto
                    if(matriz[xx][yy][0] == 'F' && (matriz[xx][yy][1] == 'n' || matriz[xx][yy][1] == 'T' || matriz[xx][yy][1] == 'L' || matriz[xx][yy][1] == '_' || matriz[xx][yy][1] == 'H' || matriz[xx][yy][1] == 'd' || matriz[xx][yy][1] == 'u' || matriz[xx][yy][1] == 'l'))
                    {
                        movX = movX + (cos(ConverteAng(-angloDrone)));
                        movZ = movZ + (sin(ConverteAng(-angloDrone)));
                        objectPosition[0] = objectPosition[0] - 5 * (cos(ConverteAng(-angloDrone)));
                        objectPosition[2] = objectPosition[2] - 5 * (sin(ConverteAng(-angloDrone)));

                        if(movX <= (xx - 1) * 20 + 11)

                            fim = 0;

                        break;
                    }
                }

                if(matriz[xx][yy][1] == 'n' || matriz[xx][yy][1] == 'T' || matriz[xx][yy][1] == 'L' || matriz[xx][yy][1] == '_' || matriz[xx][yy][1] == 'H' || matriz[xx][yy][1] == 'd' || matriz[xx][yy][1] == 'u' || matriz[xx][yy][1] == 'l')
                {
                    if(movX + cos(ConverteAng(angloDrone)) <= (xx - 1) * 20 + 17)
                    {
                        break;
                    }
                }
            }
            else if(angloDrone == 90 || angloDrone == -270)
            {
                if(chave != 0)
                {
                    if(matriz[xx][yy][0] == 'F' && matriz[xx][yy][1] == '+')
                    {
                        movX = movX + (cos(ConverteAng(-angloDrone)));
                        movZ = movZ + (sin(ConverteAng(-angloDrone)));
                        objectPosition[0] = objectPosition[0] - 5 * (cos(ConverteAng(-angloDrone)));
                        objectPosition[2] = objectPosition[2] - 5 * (sin(ConverteAng(-angloDrone)));

                        if(movZ <= (yy - 1) * 20 + 15)

                            fim = 0;

                        break;
                    }
                }
                if(matriz[xx][yy][1] == 'J' || matriz[xx][yy][1] == 'L' || matriz[xx][yy][1] == 'd' || matriz[xx][yy][1] == 'c' || matriz[xx][yy][1] == 'u' || matriz[xx][yy][1] == 'h' || matriz[xx][yy][1] == '+')
                {
                    if(movZ + sin(ConverteAng(angloDrone)) <= (yy - 1) * 20 + 17)
                    {
                        break;
                    }
                }
            }
            else if(angloDrone == -90 || angloDrone == 270)
            {
                if(chave != 0)
                {
                    if(matriz[xx][yy][0] == 'F' && (matriz[xx][yy][1] == '-' || matriz[xx][yy][1] == 'j' || matriz[xx][yy][1] == 'h'))
                    {
                        movX = movX + (cos(ConverteAng(-angloDrone)));
                        movZ = movZ + (sin(ConverteAng(-angloDrone)));
                        objectPosition[0] = objectPosition[0] - 5 * (cos(ConverteAng(-angloDrone)));
                        objectPosition[2] = objectPosition[2] - 5 * (sin(ConverteAng(-angloDrone)));

                        if(movZ >= ((yy) * 20) + 8)

                            fim = 0;

                        break;
                    }
                }
                if(matriz[xx][yy][1] == 'n' || matriz[xx][yy][1] == 'T' || matriz[xx][yy][1] == 'd' || matriz[xx][yy][1] == 'j' || matriz[xx][yy][1] == '-' || matriz[xx][yy][1] == 'c' || matriz[xx][yy][1] == 'h' || matriz[xx][yy][1] == 'l')
                {
                    if(movZ + sin(ConverteAng(angloDrone)) >= ((yy) * 20) + 2)
                    {
                        break;
                    }
                }
            }

            else if((angloDrone < 0 && angloDrone > -90) || (angloDrone < 360 && angloDrone > 270))
            {
                if(chave != 0)
                {
                    if(matriz[xx][yy][0] == 'F')
                    {
                        if(matriz[xx][yy][1] == 'J' || matriz[xx][yy][1] == 'c' || matriz[xx][yy][1] == '|')
                        {
                            movX = movX + (cos(ConverteAng(-angloDrone)));
                            objectPosition[0] = objectPosition[0] - 5 * (cos(ConverteAng(-angloDrone)));

                            if(movX >= ((xx) * 20) + 8)

                                fim = 0;

                            break;
                        }

                        else if(matriz[xx][yy][1] == '-' || matriz[xx][yy][1] == 'j' || matriz[xx][yy][1] == 'h')

                        {
                            movZ = movZ + (sin(ConverteAng(-angloDrone)));
                            objectPosition[2] = objectPosition[2] - 5 * (sin(ConverteAng(-angloDrone)));

                            if(movZ >= ((yy) * 20) + 8)
                                fim = 0;
                            break;
                        }
                    }
                }

                if(matriz[xx][yy][1] == 'n' || matriz[xx][yy][1] == 'J' || matriz[xx][yy][1] == 'H' || matriz[xx][yy][1] == 'c' || matriz[xx][yy][1] == 'u' || matriz[xx][yy][1] == '|' || matriz[xx][yy][1] == 'j')
                {

                    if(movX + cos(ConverteAng(angloDrone)) >= ((xx) * 20) + 4)
                    {
                        break;
                    }
                }
                if(matriz[xx][yy][1] == 'n' || matriz[xx][yy][1] == 'T' || matriz[xx][yy][1] == 'd' || matriz[xx][yy][1] == 'j' || matriz[xx][yy][1] == '-' || matriz[xx][yy][1] == 'c' || matriz[xx][yy][1] == 'h' || matriz[xx][yy][1] == 'l')
                {

                    if(movZ + sin(ConverteAng(angloDrone)) >= ((yy) * 20) + 4)
                    {
                        break;
                    }
                }
            }
            else if((angloDrone > 0 && angloDrone < 90) || (angloDrone > -360 && angloDrone < -270))
            {
                if(chave != 0)
                {
                    if(matriz[xx][yy][0] == 'F')
                    {
                        if(matriz[xx][yy][1] == 'J' || matriz[xx][yy][1] == 'c' || matriz[xx][yy][1] == '|')
                        {
                            movX = movX + (cos(ConverteAng(-angloDrone)));
                            objectPosition[0] = objectPosition[0] - 5 * (cos(ConverteAng(-angloDrone)));

                            if(movX >= ((xx) * 20) + 8)

                                fim = 0;

                            break;
                        }
                        else if(matriz[xx][yy][1] == '+')
                        {

                            movZ = movZ + (sin(ConverteAng(-angloDrone)));
                            objectPosition[2] = objectPosition[2] - 5 * (sin(ConverteAng(-angloDrone)));

                            if(movZ <= ((yy - 1) * 20) + 12)
                                fim = 0;
                            break;
                        }
                    }
                }

                if(matriz[xx][yy][1] == 'n' || matriz[xx][yy][1] == 'J' || matriz[xx][yy][1] == 'H' || matriz[xx][yy][1] == 'c' || matriz[xx][yy][1] == 'u' || matriz[xx][yy][1] == '|' || matriz[xx][yy][1] == 'j')
                {

                    if(movX + cos(ConverteAng(angloDrone)) >= ((xx) * 20) + 13)
                    {
                        break;
                    }
                }
                if(matriz[xx][yy][1] == 'J' || matriz[xx][yy][1] == 'L' || matriz[xx][yy][1] == 'd' || matriz[xx][yy][1] == 'c' || matriz[xx][yy][1] == 'u' || matriz[xx][yy][1] == 'h' || matriz[xx][yy][1] == '+')
                {
                    if(movZ + sin(ConverteAng(angloDrone)) <= (yy - 1) * 20 + 19)
                    {
                        break;
                    }
                }

            }
            else if((angloDrone > 90 && angloDrone < 180) || (angloDrone < -180 && angloDrone > -270))
            {
                if(chave != 0)
                {
                    if(matriz[xx][yy][0] == 'F')
                    {
                        if(matriz[xx][yy][1] == 'n' || matriz[xx][yy][1] == 'T' || matriz[xx][yy][1] == 'L' || matriz[xx][yy][1] == '_' || matriz[xx][yy][1] == 'H' || matriz[xx][yy][1] == 'd' || matriz[xx][yy][1] == 'u' || matriz[xx][yy][1] == 'l')
                        {
                            movX = movX + (cos(ConverteAng(-angloDrone)));
                            objectPosition[0] = objectPosition[0] - 5 * (cos(ConverteAng(-angloDrone)));

                            if(movX <= ((xx - 1) * 20) + 11)

                                fim = 0;

                            break;
                        }
                        else if(matriz[xx][yy][1] == '+')
                        {

                            movZ = movZ + (sin(ConverteAng(-angloDrone)));
                            objectPosition[2] = objectPosition[2] - 5 * (sin(ConverteAng(-angloDrone)));

                            if(movZ <= ((yy - 1) * 20) + 12)

                                fim = 0;

                            break;
                        }
                    }
                }
                if(matriz[xx][yy][1] == 'n' || matriz[xx][yy][1] == 'T' || matriz[xx][yy][1] == 'L' || matriz[xx][yy][1] == '_' || matriz[xx][yy][1] == 'H' || matriz[xx][yy][1] == 'd' || matriz[xx][yy][1] == 'u' || matriz[xx][yy][1] == 'l')
                {
                    if(movX + cos(ConverteAng(angloDrone)) <= (xx - 1) * 20 + 18)
                    {
                        break;
                    }
                }
                if(matriz[xx][yy][1] == 'J' || matriz[xx][yy][1] == 'L' || matriz[xx][yy][1] == 'd' || matriz[xx][yy][1] == 'c' || matriz[xx][yy][1] == 'u' || matriz[xx][yy][1] == 'h' || matriz[xx][yy][1] == '+')
                {
                    if(movZ + sin(ConverteAng(angloDrone)) <= (yy - 1) * 20 + 18)
                    {
                        break;
                    }
                }
            }
            else if((angloDrone > 180 && angloDrone < 270) || (angloDrone < -90 && angloDrone > -180))
            {
                if(chave != 0 && matriz[xx][yy][0] == 'F')
                {
                    if(matriz[xx][yy][1] == 'n' || matriz[xx][yy][1] == 'T' || matriz[xx][yy][1] == 'L' || matriz[xx][yy][1] == '_' || matriz[xx][yy][1] == 'H' || matriz[xx][yy][1] == 'd' || matriz[xx][yy][1] == 'u' || matriz[xx][yy][1] == 'l')
                    {
                        movX = movX + (cos(ConverteAng(-angloDrone)));
                        objectPosition[0] = objectPosition[0] - 5 * (cos(ConverteAng(-angloDrone)));

                        if(movX <= ((xx - 1) * 20) + 11)

                            fim = 0;

                        break;
                    }
                    else if(matriz[xx][yy][1] == '-' || matriz[xx][yy][1] == 'j' || matriz[xx][yy][1] == 'h')
                    {

                        movZ = movZ + (sin(ConverteAng(-angloDrone)));
                        objectPosition[2] = objectPosition[2] - 5 * (sin(ConverteAng(-angloDrone)));

                        if(movZ >= ((yy) * 20) + 8)

                            fim = 0;

                        break;
                    }
                }
                if(matriz[xx][yy][1] == 'n' || matriz[xx][yy][1] == 'T' || matriz[xx][yy][1] == 'L' || matriz[xx][yy][1] == '_' || matriz[xx][yy][1] == 'H' || matriz[xx][yy][1] == 'd' || matriz[xx][yy][1] == 'u' || matriz[xx][yy][1] == 'l')
                {
                    if(movX + cos(ConverteAng(angloDrone)) <= (xx - 1) * 20 + 18)
                    {
                        break;
                    }
                }
                if(matriz[xx][yy][1] == 'n' || matriz[xx][yy][1] == 'T' || matriz[xx][yy][1] == 'd' || matriz[xx][yy][1] == 'j' || matriz[xx][yy][1] == '-' || matriz[xx][yy][1] == 'c' || matriz[xx][yy][1] == 'h' || matriz[xx][yy][1] == 'l')
                {

                    if(movZ + sin(ConverteAng(angloDrone)) >= ((yy) * 20) + 12)
                    {
                       break;
                    }
                }
            }


            // deixa marcado o caminho percorrido
            // x0 y0 é a posição que vc estava
            //xx yy é a posição em que vc esta

            //if(matriz[x0][y0][0] != 'F')
            //   matriz[x0][y0][0] = '|';

            //reailiza movimento
            movX = movX + (cos(ConverteAng(-angloDrone)));
            movZ = movZ + (sin(ConverteAng(-angloDrone)));
            objectPosition[0] = objectPosition[0] - 5 * (cos(ConverteAng(-angloDrone)));
            objectPosition[2] = objectPosition[2] - 5 * (sin(ConverteAng(-angloDrone)));

            if(matriz[xx][yy][0] != 'F')
               matriz[xx][yy][0] = 'S';


            verificaChave();

            break;

        case GLUT_KEY_DOWN:

            x0 = trunc((movX + 11) / 20);
            y0 = trunc((movZ + 11) / 20);

            xx = trunc((movX + 11 - (cos(ConverteAng(-angloDrone)))) / 20);
            yy = trunc((movZ + 11 - (sin(ConverteAng(-angloDrone)))) / 20);

            // faz a roda girar para tras
            if (gira > 0 )
            {
                gira -= 3;
            }
            else
                gira = 9;
            // fim da roda girar para tras

            if(angloDrone == 0)
            {

                if(matriz[xx][yy][1] == 'n' || matriz[xx][yy][1] == 'T' || matriz[xx][yy][1] == 'L' || matriz[xx][yy][1] == '_' || matriz[xx][yy][1] == 'H' || matriz[xx][yy][1] == 'd' || matriz[xx][yy][1] == 'u' || matriz[xx][yy][1] == 'l')
                {
                    if(xx == 0)
                    {
                        if(movX - cos(ConverteAng(angloDrone)) <= -7)
                        {
                            break;
                        }
                    }
                    else if(movX - cos(ConverteAng(angloDrone)) <= (xx - 1) * 20 + 13)
                    {

                        break;
                    }
                }
            }
            else if(angloDrone == 180 || angloDrone == -180)
            {
                if(matriz[xx][yy][1] == '0')
                {
                    break;
                }
                else if(matriz[xx][yy][1] == 'n' || matriz[xx][yy][1] == 'J' || matriz[xx][yy][1] == 'H' || matriz[xx][yy][1] == 'c' || matriz[xx][yy][1] == 'u' || matriz[xx][yy][1] == '|' || matriz[xx][yy][1] == 'j')
                {
                    if(movX - cos(ConverteAng(angloDrone)) >= (xx * 20 + 6))
                    {
                        break;
                    }
                }
            }
            else if(angloDrone == -90 || angloDrone == 270)
            {
                if(matriz[xx][yy][1] == '0')
                {
                    break;
                }
                if(matriz[xx][yy][1] == 'J' || matriz[xx][yy][1] == 'L' || matriz[xx][yy][1] == 'd' || matriz[xx][yy][1] == 'h' || matriz[xx][yy][1] == 'u' || matriz[xx][yy][1] == 'c' || matriz[xx][yy][1] == '+')
                {
                    if(movZ - sin(ConverteAng(angloDrone)) <= (yy - 1) * 20 + 14)
                    {
                        break;
                    }
                }
            }
            else if(angloDrone == 90 || angloDrone == -270)
            {
                if(matriz[xx][yy][1] == '0')
                {
                    break;
                }
                if(matriz[xx][yy][1] == 'n' || matriz[xx][yy][1] == 'T' || matriz[xx][yy][1] == '-' || matriz[xx][yy][1] == 'h' || matriz[xx][yy][1] == 'l' || matriz[xx][yy][1] == 'c' || matriz[xx][yy][1] == 'j' || matriz[xx][yy][1] == 'd')
                {
                    if(movZ - sin(ConverteAng(angloDrone)) >= (yy * 20 + 6))
                    {
                        break;
                    }
                }
            }
            else if((angloDrone < 0 && angloDrone > -90) || (angloDrone < 360 && angloDrone > 270))
            {
                if(matriz[xx][yy][1] == 'n' || matriz[xx][yy][1] == 'T' || matriz[xx][yy][1] == 'L' || matriz[xx][yy][1] == '_' || matriz[xx][yy][1] == 'H' || matriz[xx][yy][1] == 'd' || matriz[xx][yy][1] == 'u' || matriz[xx][yy][1] == 'l')
                {
                    if(movX - cos(ConverteAng(angloDrone)) <= (xx - 1) * 20 + 13)
                    {
                        break;
                    }
                }
                if(matriz[xx][yy][1] == 'J' || matriz[xx][yy][1] == 'L' || matriz[xx][yy][1] == 'd' || matriz[xx][yy][1] == 'h' || matriz[xx][yy][1] == 'u' || matriz[xx][yy][1] == 'c' || matriz[xx][yy][1] == '+')
                {
                    if(movZ - sin(ConverteAng(angloDrone)) <= (yy - 1) * 20 + 15)
                    {
                        break;
                    }
                }
            }
            else if((angloDrone > 0 && angloDrone < 90) || (angloDrone > -360 && angloDrone < -270))
            {
                if(matriz[xx][yy][1] == 'n' || matriz[xx][yy][1] == 'T' || matriz[xx][yy][1] == 'L' || matriz[xx][yy][1] == '_' || matriz[xx][yy][1] == 'H' || matriz[xx][yy][1] == 'd' || matriz[xx][yy][1] == 'u' || matriz[xx][yy][1] == 'l')
                {
                    if(movX - cos(ConverteAng(angloDrone)) <= (xx - 1) * 20 + 13)
                    {
                        break;
                    }

                    if(matriz[xx][yy][1] == 'n' || matriz[xx][yy][1] == 'T' || matriz[xx][yy][1] == '-' || matriz[xx][yy][1] == 'h' || matriz[xx][yy][1] == 'l' || matriz[xx][yy][1] == 'c' || matriz[xx][yy][1] == 'j' || matriz[xx][yy][1] == 'd')
                    {
                        if(movZ - sin(ConverteAng(angloDrone)) >= (yy * 20 + 6))
                        {
                            break;
                        }
                    }
                }
            }
            else if((angloDrone > 90 && angloDrone < 180) || (angloDrone > -180 && angloDrone < -270))
            {
                if(matriz[xx][yy][1] == 'n' || matriz[xx][yy][1] == 'J' || matriz[xx][yy][1] == 'H' || matriz[xx][yy][1] == 'c' || matriz[xx][yy][1] == 'u' || matriz[xx][yy][1] == '|' || matriz[xx][yy][1] == 'j')
                {
                    if(movX - cos(ConverteAng(angloDrone)) >= (xx * 20 + 6))
                    {
                        break;
                    }
                }
                if(matriz[xx][yy][1] == 'n' || matriz[xx][yy][1] == 'T' || matriz[xx][yy][1] == '-' || matriz[xx][yy][1] == 'h' || matriz[xx][yy][1] == 'l' || matriz[xx][yy][1] == 'c' || matriz[xx][yy][1] == 'j' || matriz[xx][yy][1] == 'd')
                {
                    if(movZ - sin(ConverteAng(angloDrone)) >= (yy * 20 + 6))
                    {
                        break;
                    }
                }
            }
            else if((angloDrone > 180 && angloDrone < 270) || (angloDrone < -90 && angloDrone > -180))
            {
                if(matriz[xx][yy][1] == 'J' || matriz[xx][yy][1] == 'L' || matriz[xx][yy][1] == 'd' || matriz[xx][yy][1] == 'h' || matriz[xx][yy][1] == 'u' || matriz[xx][yy][1] == 'c')
                {
                    if(movZ - sin(ConverteAng(angloDrone)) <= (yy - 1) * 20 + 14)
                    {
                        break;
                    }
                }
                if(matriz[xx][yy][1] == 'n' || matriz[xx][yy][1] == 'J' || matriz[xx][yy][1] == 'H' || matriz[xx][yy][1] == 'c' || matriz[xx][yy][1] == 'u' || matriz[xx][yy][1] == '|' || matriz[xx][yy][1] == 'j')
                {
                    if(movX - cos(ConverteAng(angloDrone)) >= xx * 20 + 6)
                    {
                        break;
                    }
                }
            }

            //reailiza movimento
            movX = movX - (cos(ConverteAng(-angloDrone)));
            movZ = movZ - (sin(ConverteAng(-angloDrone)));
            objectPosition[0] = objectPosition[0] + 5 * (cos(ConverteAng(-angloDrone)));
            objectPosition[2] = objectPosition[2] + 5 * (sin(ConverteAng(-angloDrone)));
            verificaChave();


            break;
        }

        printf("\n\n");
        for(int i = 8; i >= 0; i--)
        {
            for(int j = 8; j >= 0; j--)
                printf("%c", matriz[i][j][0]);
            printf("\n");
        }
        printf("\n\n");

        PosicionaObservador();
        glutPostRedisplay();
    }
}

void TeclasNormais(unsigned char tecla, int x, int y)
{
    switch (tecla)
    {
    case 'f':
        fim = 0;
        break;
    case 27:
        exit(0); //ESC
        break;
    case 't':
        angle = 40;// muda para 1ª pessoa
        break;
    case 'r':
        angle = 80;//muda para terceira pessoa
        break;
    }

    glutPostRedisplay();
}

// Princical Principal
int main()
{
    int argc = 0;
    char *argv[] = { (char *) "gl", 0 };

    glutInit(&argc, argv);

// Define do modo de operacao da GLUT
    glutInitDisplayMode(GLUT_DOUBLE | GLUT_RGB | GLUT_DEPTH);

// Especifica a posi??o inicial da janela GLUT
    glutInitWindowPosition(5, 5);

// Especifica o tamanho inicial em pixels da janela GLUT
    glutInitWindowSize(1350, 690);

// Cria a janela passando como argumento o titulo da mesma
    glutCreateWindow("Batman Game");

// Registra a funcao callback de redesenho da janela de visualizacao
    glutDisplayFunc(Desenha);

// Registra a funcao callback para tratamento das teclas especiais
    glutSpecialFunc(TeclasEspeciais);

// Registra a funcao callback para tratamento do redimensionamento da janela
    glutReshapeFunc(AlteraTamanhoJanela);

// Registra a funcao callback para tratamento dde teclas normais do teclado
    glutKeyboardFunc(TeclasNormais);

    Inicializa();
    glutMainLoop();
}

