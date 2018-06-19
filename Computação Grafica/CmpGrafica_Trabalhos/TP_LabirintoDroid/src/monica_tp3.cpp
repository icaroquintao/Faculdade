#include <GL/gl.h>
#include <GL/glut.h>
#include <stdio.h>
#include <stdlib.h>
#include <iostream>
#include <fstream>
#include <math.h>
#include <time.h>

#define PASSO 1
#define GIRO 10
#define mX -816 //102 * 8
#define mZ -190

#include "CarregarArquivo.cpp"
CarregarArquivo Drone_arq;

using namespace std;

void EspecificaParametrosVisualizacao(void);
void PosicionaObservador(void);

GLubyte porta[256][256][3];
GLubyte parede[256][256][3];
GLubyte chao[256][256][3];
GLubyte drone[256][256][3];
GLubyte dreher[256][256][3];
GLubyte final[256][256][3];

//char matriz[9][9][2] = {
//                { { 'S', 'd' }, { '*', '0' }, { '|', 'u' }, { '|', 'H' }, { '|', 'H' }, { '|', 'T' }, { '*', '0' }, { '|', 'L' }, { '|', 'n' } },
//                { { '|', 'J' }, { '|', 'T' }, { '*', '0' }, { '*', '0' }, { '*', '0' }, { '|', '+' }, { '|', 'H' }, { '|', '-' }, { '*', '0' } },
//                { { '*', '0' }, { '|', 'h' }, { '*', '0' }, { '|', 'L' }, { '|', 'H' }, { '|', '-' }, { '*', '0' }, { '|', 'J' }, { '|', 'l' } },
//                { { '|', 'L' }, { '|', '|' }, { '|', 'H' }, { '|', '-' }, { '*', '0' }, { '|', 'J' }, { '|', 'l' }, { '*', '0' }, { '|', 'h' } },
//                { { '|', 'c' }, { '*', '0' }, { '*', '0' }, { '|', 'h' }, { '*', '0' }, { '*', '0' }, { '|', 'c' }, { '*', '0' }, { '|', 'h' } },
//                { { '*', '0' }, { '|', 'd' }, { '*', '0' }, { '|', '+' }, { '|', 'H' }, { '|', 'l' }, { '*', '0' }, { '|', 'u' }, { '|', '-' } },
//                { { '|', 'L' }, { '|', '|' }, { '|', 'H' }, { '|', '-' }, { '*', '0' }, { '|', '+' }, { '|', 'n' }, { '*', '0' }, { '|', 'h' } },
//                { { '|', 'h' }, { '*', '0' }, { '*', '0' }, { '|', 'h' }, { '*', '0' }, { '|', 'c' }, { '*', '0' }, { '|', 'u' }, { '|', 'j' } },
//                { { '|', 'c' }, { '*', '0' }, { '|', 'u' }, { '|', '|' }, { '|', 'n' }, { '*', '0' }, { '*', '0' }, { '*', '0' }, { '*', '0' } } };

char matriz[9][9][2] = { { { 'S', 'd' }, { '*', '0' }, { '|', 'u' }, { '|', 'H' }, { '|', 'H' }, { '|', 'T' }, { '*', '0' }, { '|', 'L' }, { '|', 'n' } }, { { '|', 'J' }, { '|', 'T' }, { '*', '0' }, { '*', '0' }, { '*', '0' }, { '|', '+' }, { '|', 'H' }, { '|', '-' }, { '*', '0' } }, { { '*', '0' },
                { '|', 'h' }, { '*', '0' }, { '|', 'L' }, { '|', 'H' }, { '|', '-' }, { '*', '0' }, { '|', 'J' }, { '|', 'l' } }, { { '|', 'L' }, { '|', '|' }, { '|', 'H' }, { '|', '-' }, { '*', '0' }, { '|', 'J' }, { '|', 'l' }, { '*', '0' }, { '|', 'h' } }, { { '|', 'c' }, { '*', '0' },
                { '*', '0' }, { '|', 'h' }, { '*', '0' }, { '*', '0' }, { '|', 'c' }, { '*', '0' }, { '|', 'h' } }, { { '*', '0' }, { '|', 'd' }, { '*', '0' }, { '|', '+' }, { '|', 'H' }, { '|', 'l' }, { '*', '0' }, { '|', 'u' }, { '|', '-' } }, { { '|', 'L' }, { '|', '|' }, { '|', 'H' },
                { '|', '-' }, { '*', '0' }, { '|', '+' }, { '|', 'n' }, { '*', '0' }, { '|', 'h' } }, { { '|', 'h' }, { '*', '0' }, { '*', '0' }, { '|', 'h' }, { '*', '0' }, { '|', 'c' }, { '*', '0' }, { '|', 'u' }, { '|', 'j' } }, { { '|', 'c' }, { '*', '0' }, { '|', 'u' }, { '|', '|' },
                { '|', 'n' }, { '*', '0' }, { '*', '0' }, { '*', '0' }, { '*', '0' } } };

// Armazena identifica��o da textura
GLuint textura_parede, textura_chao, textura_porta, textura_drone, textura_dreher, textura_final;

GLfloat angle, fAspect;

int direcao = 0, angloDrone = 0, ant = 0, fim = 1, chave = 0;
float movX = 0, movZ = 0;

GLfloat offset[3] = { 50, 60, 0 };
GLfloat objectPosition[3] = { movX, 0, movZ };
GLfloat cameraPosition[3];

float ConverteAng(int anglo)
{
    return M_PI * anglo / 180.0f;
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

// Define a reflet�ncia do material
    glMaterialfv(GL_FRONT, GL_SPECULAR, especularidade);

// Define a concentra��o do brilho
    glMateriali(GL_FRONT, GL_SHININESS, especMaterial);

// Ativa o uso da luz ambiente
    glLightModelfv(GL_LIGHT_MODEL_AMBIENT, luzAmbiente);

// Define os par�metros da luz de n�mero 0
    glLightfv(GL_LIGHT0, GL_AMBIENT, luzAmbiente);
    glLightfv(GL_LIGHT0, GL_DIFFUSE, luzDifusa);
    glLightfv(GL_LIGHT0, GL_SPECULAR, luzEspecular);
    glLightfv(GL_LIGHT0, GL_POSITION, posicaoLuz);
}

void cuboMenor(GLuint textura_quad)
{
    glPushMatrix();

    glTranslated(mX, -40, mZ);
    glScaled(0.08, 0.08, 0.08);
    glEnable(GL_TEXTURE_2D);
    glBindTexture(GL_TEXTURE_2D, textura_quad);
    // Desenha um cubo
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

    glBegin(GL_POLYGON); // Face lateral direita
    glNormal3f(1, 0, 0); // Normal da face
    glTexCoord2f(0, 1);
    glVertex3f(50.0, 50.0, 50.0);
    glTexCoord2f(0, 0);
    glVertex3f(50.0, -50.0, 50.0);
    glTexCoord2f(1, 0);
    glVertex3f(50.0, -50.0, -50.0);
    glTexCoord2f(1, 1);
    glVertex3f(50.0, 50.0, -50.0);
    glEnd();

    glBegin(GL_POLYGON); // Face superior
    glNormal3f(0, 1, 0); // Normal da face
    glTexCoord2f(0, 0);
    glVertex3f(-50.0, 50.0, -50.0);
    glTexCoord2f(0, 1);
    glVertex3f(-50.0, 50.0, 50.0);
    glTexCoord2f(1, 1);
    glVertex3f(50.0, 50.0, 50.0);
    glTexCoord2f(1, 0);
    glVertex3f(50.0, 50.0, -50.0);
    glEnd();

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
    glLoadIdentity();
    gluOrtho2D(-1, 1, -1, 1);

    glMatrixMode(GL_MODELVIEW);
    glLoadIdentity();
    //gluLookAt(1, 0, 0,0, 0, 0, 0,1,0);

    //glRotatef(angloDrone, 0, 0, 1);
    //glTranslatef(objectPosition[0] + 10, objectPosition[1] + objectPosition[1] + 80, objectPosition[2]);
    //glRotated(10, 0, 0, 1);
    glScalef(1, 6, 6);

    float t = 180 / 9;

    for(int i = 0; i < 9; i++)
        for(int j = 0; j < 9; j++)
        {
            glViewport((t * j) + 50, (t * i) + 20, t, t);

            if(matriz[i][j][0] == '|')
            {
                glColor3f(0.5, 0.1, 0.5);
                desenha_quadrado(25);
            }
            else if(matriz[i][j][0] == 'S')
            {

                glColor3f(1, 1, 0);
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

void carregaDrone()
{
    glPushMatrix();
    glScaled(5, 5, 5);
    glTranslated(0, -9, 0);

    glTranslatef(-movX, 0, -movZ);
    glRotated(angloDrone, 0, 1, 0);

    for(int j = 0; j < (Drone_arq.faces).size(); ++j)
    {
        glEnable(GL_TEXTURE_2D);
        glBindTexture(GL_TEXTURE_2D, textura_drone);

        glBegin(GL_POLYGON);
        for(int i = 0; i < (Drone_arq.faces[j]).size(); ++i)
        {
            GLfloat normal[3] = { Drone_arq.normais[Drone_arq.faces[j][i][2]][0], Drone_arq.normais[Drone_arq.faces[j][i][2]][1], Drone_arq.normais[Drone_arq.faces[j][i][2]][2] };
            glNormal3fv(normal);

            GLfloat textura[2] = { Drone_arq.texturas[Drone_arq.faces[j][i][1]][0], Drone_arq.texturas[Drone_arq.faces[j][i][1]][1] };
            glTexCoord2fv(textura);

            GLfloat vert[3] = { Drone_arq.vertices1[Drone_arq.faces[j][i][0]][0], Drone_arq.vertices1[Drone_arq.faces[j][i][0]][1], Drone_arq.vertices1[Drone_arq.faces[j][i][0]][2] };
            glVertex3fv(vert);
        }
        glEnd();
        glDisable(GL_TEXTURE_2D);
    }
    glPopMatrix();
}

void desenha_face_dir(int i, int j, GLuint textura)
{
    glPushMatrix();
//    glScaled(0.5, 0.5, 0.5);
    glTranslatef((-100) * i, 0, j * (-100));
    glBindTexture(GL_TEXTURE_2D, textura);
    glBegin(GL_POLYGON); // Face lateral direita
    glNormal3f(1, 0, 0); // Normal da face
    glTexCoord2f(0, 1);
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
//    glScaled(0.5, 0.5, 0.5);
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
//    glScaled(0.5, 0.5, 0.5);
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
//    glScaled(0.5, 0.5, 0.5);
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
//    glScaled(0.5, 0.5, 0.5);
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

// Fun��o callback chamada para fazer o desenho
void Desenha(void)
{
    EspecificaParametrosVisualizacao();

    if(fim == 0)
    {
        printf("*** Callback de redesenho da tela\n");

        glViewport(0, 0, 700, 700);

        objectPosition[0] = 0;
        objectPosition[1] = 0;
        objectPosition[2] = 0;

        offset[0] = 0;
        offset[0] = 0;
        offset[0] = 0;

        PosicionaObservador();

        glClearColor(0.98f, 0.94f, 0.32f, 1.0f);
        glClear(GL_COLOR_BUFFER_BIT);

        glColor3f(0.0f, 0.0f, 0.0f);
        glRasterPos3f(-10, 0, 10);
        char e[13] = { 'V', 'o', 'c', 'e', ' ', 'V', 'e', 'n', 'c', 'e', 'u', ' ', '!' };
        for(int q = 0; q < 13; q++)
            glutBitmapCharacter(GLUT_BITMAP_TIMES_ROMAN_24, e[q]);
    }
    else
    {
        glViewport(0, 0, 700, 700);

        // Troca cor corrente para azul
        glColor3f(0.0f, 0.0f, 1.0f);

        // Limpa a janela de visualiza��o com a cor
        // de fundo definida previamente
        glClear(GL_COLOR_BUFFER_BIT | GL_DEPTH_BUFFER_BIT);
        carregaMapa();
        carregaDrone();

        if(chave == 0)
            cuboMenor(textura_dreher);

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
            if(y > 3 && x > 3)
            {
                matriz[x][y][0] = 'F';
                break;
            }
        }
    }

    printf("\n\n");
    for(int i = 0; i < 9; i++)
    {
        for(int j = 0; j < 9; j++)
            printf("%c", matriz[i][j][0]);
        printf("\n");
    }
    printf("\n\n");

}

// Inicializa��o
void Inicializa(void)
{
// Define a cor de fundo da janela de visualiza��o
    glClearColor(0.7f, 0.6f, 0.6f, 0.6f);

// Habilita a defini��o da cor do material a partir da cor corrente
    glEnable(GL_COLOR_MATERIAL);

//Habilita o uso de ilumina��o
    glEnable(GL_LIGHTING);

// Habilita a luz de n�mero 0
    glEnable(GL_LIGHT0);

// Habilita o depth-buffering
    glEnable(GL_DEPTH_TEST);

// Inicializa a vari�vel que especifica o �ngulo da proje��o
// perspectiva
    angle = 60;
// Inicializa as vari�veis usadas para alterar a posi��o do
// observador virtual

    inicializaMatriz();

    Drone_arq.Carregar("Droid_final.obj"); //carrega o arquivo

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
            c = arq.get();
        for(int i = 0; i < 256; i++)
            for(int j = 0; j < 256; j++)
            {
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
            c = arq2.get();
        for(int i = 0; i < 256; i++)
            for(int j = 0; j < 256; j++)
            {
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

        ifstream arq4("textura.bmp", ios::binary);

        if(!arq4)
            cout << "Erro abriu";

        for(int i = 0; i < 122; i++)
            c = arq4.get();
        for(int i = 0; i < 256; i++)
            for(int j = 0; j < 256; j++)
            {
                c = arq4.get();
                drone[i][j][2] = c;
                c = arq4.get();
                drone[i][j][1] = c;
                c = arq4.get();
                drone[i][j][0] = c;
            }

        arq4.close();
        arq4.clear();

        ifstream arq5("dreher.bmp", ios::binary);

        if(!arq5)
            cout << "Erro abriu";

        for(int i = 0; i < 30; i++)
            c = arq5.get();
        for(int i = 0; i < 256; i++)
            for(int j = 0; j < 256; j++)
            {
                c = arq5.get();
                dreher[i][j][2] = c;
                c = arq5.get();
                dreher[i][j][1] = c;
                c = arq5.get();
                dreher[i][j][0] = c;
            }

        arq5.close();
        arq5.clear();

        ifstream arq6("final.bmp", ios::binary);

        if(!arq6)
            cout << "Erro abriu";

        for(int i = 0; i < 60; i++)
            c = arq6.get();
        for(int i = 0; i < 256; i++)
            for(int j = 0; j < 256; j++)
            {
                c = arq6.get();
                final[i][j][2] = c;
                c = arq6.get();
                final[i][j][1] = c;
                c = arq6.get();
                final[i][j][0] = c;
            }

        arq6.close();
        arq6.clear();

    }
    catch(...)
    {
        cout << "Erro ao ler imagem" << endl;
    }

    // drone
    glGenTextures(1, &textura_drone);

    // Associa a textura aos comandos seguintes
    glBindTexture(GL_TEXTURE_2D, textura_drone);

    // Envia a textura para uso pela OpenGL
    glTexImage2D(GL_TEXTURE_2D, 0, 3, 256, 256, 0, GL_RGB, GL_UNSIGNED_BYTE, drone);

    // Define os filtros de magnifica��o e minifica��o
    glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_MAG_FILTER, GL_NEAREST);
    glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_MIN_FILTER, GL_NEAREST);

    // Seleciona o modo de aplica��o da textura
    glTexEnvi(GL_TEXTURE_ENV, GL_TEXTURE_ENV_MODE, GL_REPLACE);

    // chao
    glGenTextures(1, &textura_chao);

    // Associa a textura aos comandos seguintes
    glBindTexture(GL_TEXTURE_2D, textura_chao);

    // Envia a textura para uso pela OpenGL
    glTexImage2D(GL_TEXTURE_2D, 0, 3, 256, 256, 0, GL_RGB, GL_UNSIGNED_BYTE, chao);

    // Define os filtros de magnifica��o e minifica��o
    glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_MAG_FILTER, GL_NEAREST);
    glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_MIN_FILTER, GL_NEAREST);

    // Seleciona o modo de aplica��o da textura
    glTexEnvi(GL_TEXTURE_ENV, GL_TEXTURE_ENV_MODE, GL_REPLACE);

    // porta
    glGenTextures(1, &textura_porta);

    // Associa a textura aos comandos seguintes
    glBindTexture(GL_TEXTURE_2D, textura_porta);

    // Envia a textura para uso pela OpenGL
    glTexImage2D(GL_TEXTURE_2D, 0, 3, 256, 256, 0, GL_RGB, GL_UNSIGNED_BYTE, porta);

    // Define os filtros de magnifica��o e minifica��o
    glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_MAG_FILTER, GL_NEAREST);
    glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_MIN_FILTER, GL_NEAREST);

    // Seleciona o modo de aplica��o da textura
    glTexEnvi(GL_TEXTURE_ENV, GL_TEXTURE_ENV_MODE, GL_REPLACE);

    // parede
    glGenTextures(1, &textura_parede);

    // Associa a textura aos comandos seguintes
    glBindTexture(GL_TEXTURE_2D, textura_parede);

    // Envia a textura para uso pela OpenGL
    glTexImage2D(GL_TEXTURE_2D, 0, 3, 256, 256, 0, GL_RGB, GL_UNSIGNED_BYTE, parede);

    // Define os filtros de magnifica��o e minifica��o
    glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_MAG_FILTER, GL_NEAREST);
    glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_MIN_FILTER, GL_NEAREST);

    // Seleciona o modo de aplica��o da textura
    glTexEnvi(GL_TEXTURE_ENV, GL_TEXTURE_ENV_MODE, GL_REPLACE);

    // dreher
    glGenTextures(1, &textura_dreher);

    // Associa a textura aos comandos seguintes
    glBindTexture(GL_TEXTURE_2D, textura_dreher);

    // Envia a textura para uso pela OpenGL
    glTexImage2D(GL_TEXTURE_2D, 0, 3, 256, 256, 0, GL_RGB, GL_UNSIGNED_BYTE, dreher);

    // Define os filtros de magnifica��o e minifica��o
    glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_MAG_FILTER, GL_NEAREST);
    glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_MIN_FILTER, GL_NEAREST);

    // Seleciona o modo de aplica��o da textura
    glTexEnvi(GL_TEXTURE_ENV, GL_TEXTURE_ENV_MODE, GL_REPLACE);

    // final
    glGenTextures(1, &textura_final);

    // Associa a textura aos comandos seguintes
    glBindTexture(GL_TEXTURE_2D, textura_final);

    // Envia a textura para uso pela OpenGL
    glTexImage2D(GL_TEXTURE_2D, 0, 3, 256, 256, 0, GL_RGB, GL_UNSIGNED_BYTE, final);

    // Define os filtros de magnifica��o e minifica��o
    glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_MAG_FILTER, GL_NEAREST);
    glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_MIN_FILTER, GL_NEAREST);

    // Seleciona o modo de aplica��o da textura
    glTexEnvi(GL_TEXTURE_ENV, GL_TEXTURE_ENV_MODE, GL_REPLACE);
}

// Fun��o usada para especificar a posi��o do observador virtual
void PosicionaObservador(void)
{
    // Especifica sistema de coordenadas do modelo

    glMatrixMode(GL_MODELVIEW);
    // Inicializa sistema de coordenadas do modelo
    glLoadIdentity();
    // Especifica posi��o do observador e do alvo

    cameraPosition[0] = objectPosition[0] + offset[0];
    cameraPosition[1] = objectPosition[1] + offset[1];
    cameraPosition[2] = objectPosition[2] + offset[2];

    gluLookAt(cameraPosition[0], cameraPosition[1], cameraPosition[2], objectPosition[0], objectPosition[1], objectPosition[2], 0, 1, 0);

    DefineIluminacao();
}

// Fun��o usada para especificar o volume de visualiza��o
void EspecificaParametrosVisualizacao(void)
{
    // Especifica sistema de coordenadas de proje��o
    glMatrixMode(GL_PROJECTION);
    // Inicializa sistema de coordenadas de proje��o
    glLoadIdentity();

    // Especifica a proje��o perspectiva(angulo,aspecto,zMin,zMax)
    gluPerspective(angle, fAspect, 0.1, 1000);

    PosicionaObservador();
}

// Fun��o callback chamada quando o tamanho da janela � alterado
void AlteraTamanhoJanela(GLsizei w, GLsizei h)
{
    // Para previnir uma divis�o por zero
    if(h == 0)
        h = 1;

    // Especifica as dimens�es da viewport
    glViewport(0, 0, w, h);

    // Calcula a corre��o de aspecto
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

// Fun��o callback chamada para gerenciar eventos de teclas especiais (F1,PgDn,...)
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

                offset[2] = 50 * (sin(ConverteAng(-angloDrone))); //objectPosition[0] - (cos(ConverteAng(-angloDrone)) * offset[0] * PASSO);
                offset[0] = 50 * (cos(ConverteAng(-angloDrone))); //objectPosition[0] - (cos(ConverteAng(-angloDrone)) * offset[0] * PASSO);

                break;
            case GLUT_KEY_RIGHT:
                angloDrone = angloDrone - GIRO;

                if(angloDrone <= -360)
                    angloDrone = 0;

                offset[2] = 50 * (sin(ConverteAng(-angloDrone))); //objectPosition[0] - (cos(ConverteAng(-angloDrone)) * offset[0] * PASSO);
                offset[0] = 50 * (cos(ConverteAng(-angloDrone))); //objectPosition[0] - (cos(ConverteAng(-angloDrone)) * offset[0] * PASSO);

                break;
            case GLUT_KEY_UP: //se for reto
                x0 = trunc((movX + 11) / 20);
                y0 = trunc((movZ + 11) / 20);

                xx = trunc((movX + 11 + (cos(ConverteAng(-angloDrone)) * PASSO)) / 20);
                yy = trunc((movZ + 11 + (sin(ConverteAng(-angloDrone)) * PASSO)) / 20);

                if(angloDrone == 0)
                {
                    if(chave != 0)
                    {
                        if(matriz[xx][yy][0] == 'F')
                        {
                            movX = movX + (cos(ConverteAng(-angloDrone)) * PASSO);
                            movZ = movZ + (sin(ConverteAng(-angloDrone)) * PASSO);
                            objectPosition[0] = objectPosition[0] - 5 * (cos(ConverteAng(-angloDrone)) * PASSO);
                            objectPosition[2] = objectPosition[2] - 5 * (sin(ConverteAng(-angloDrone)) * PASSO);
                            if(movX >= xx * 20 + 9)
                                fim = 0;
                            break;
                        }
                    }
                    else if(matriz[xx][yy][1] == 'n' || matriz[xx][yy][1] == 'J' || matriz[xx][yy][1] == 'H' || matriz[xx][yy][1] == 'c' || matriz[xx][yy][1] == 'u' || matriz[xx][yy][1] == '|' || matriz[xx][yy][1] == 'j')
                    {
                        if(xx == 0)
                        {
                            if(movX + cos(ConverteAng(angloDrone) * PASSO) >= 8)
                            {
                                printf("Impedido de realizar movimento!!\n");
                                break;
                            }
                        }
                        else if(movX + 2 + cos(ConverteAng(angloDrone) * PASSO) >= (xx * 20 + 9))
                        {
                            printf("Impedido de realizar movimento!!\n");
                            break;
                        }
                    }
                }
                else if(angloDrone == 180 || angloDrone == -180)
                {
                    if(chave != 0)
                    {
                        if(matriz[xx][yy][0] == 'F' && (matriz[xx][yy][1] == 'n' || matriz[xx][yy][1] == 'T' || matriz[xx][yy][1] == 'L' || matriz[xx][yy][1] == '_' || matriz[xx][yy][1] == 'H' || matriz[xx][yy][1] == 'd' || matriz[xx][yy][1] == 'u' || matriz[xx][yy][1] == 'l'))
                        {
                            movX = movX + (cos(ConverteAng(-angloDrone)) * PASSO);
                            movZ = movZ + (sin(ConverteAng(-angloDrone)) * PASSO);
                            objectPosition[0] = objectPosition[0] - 5 * (cos(ConverteAng(-angloDrone)) * PASSO);
                            objectPosition[2] = objectPosition[2] - 5 * (sin(ConverteAng(-angloDrone)) * PASSO);
                            if(movX <= (xx - 1) * 20 + 11)
                                fim = 0;
                            break;
                        }
                    }
                    if(matriz[xx][yy][1] == 'n' || matriz[xx][yy][1] == 'T' || matriz[xx][yy][1] == 'L' || matriz[xx][yy][1] == '_' || matriz[xx][yy][1] == 'H' || matriz[xx][yy][1] == 'd' || matriz[xx][yy][1] == 'u' || matriz[xx][yy][1] == 'l')
                    {
                        if(movX - 2 + cos(ConverteAng(angloDrone) * PASSO) <= (xx - 1) * 20 + 11)
                        {
                            printf("Impedido de realizar movimento!!\n");
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
                            movX = movX + (cos(ConverteAng(-angloDrone)) * PASSO);
                            movZ = movZ + (sin(ConverteAng(-angloDrone)) * PASSO);
                            objectPosition[0] = objectPosition[0] - 5 * (cos(ConverteAng(-angloDrone)) * PASSO);
                            objectPosition[2] = objectPosition[2] - 5 * (sin(ConverteAng(-angloDrone)) * PASSO);
                            if(movZ <= (yy - 1) * 20 + 12)
                                fim = 0;
                            break;
                        }
                    }
                    if(matriz[xx][yy][1] == 'J' || matriz[xx][yy][1] == 'L' || matriz[xx][yy][1] == 'd' || matriz[xx][yy][1] == 'c' || matriz[xx][yy][1] == 'u' || matriz[xx][yy][1] == 'h' || matriz[xx][yy][1] == '+')
                    {
                        if(movZ - 2 + sin(ConverteAng(angloDrone) * PASSO) <= (yy - 1) * 20 + 12)
                        {
                            printf("Impedido de realizar movimento!!\n");
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
                            movX = movX + (cos(ConverteAng(-angloDrone)) * PASSO);
                            movZ = movZ + (sin(ConverteAng(-angloDrone)) * PASSO);
                            objectPosition[0] = objectPosition[0] - 5 * (cos(ConverteAng(-angloDrone)) * PASSO);
                            objectPosition[2] = objectPosition[2] - 5 * (sin(ConverteAng(-angloDrone)) * PASSO);
                            if(movZ >= ((yy) * 20) + 8)
                                fim = 0;
                            break;
                        }
                    }
                    if(matriz[xx][yy][1] == 'n' || matriz[xx][yy][1] == 'T' || matriz[xx][yy][1] == 'd' || matriz[xx][yy][1] == 'j' || matriz[xx][yy][1] == '-' || matriz[xx][yy][1] == 'c' || matriz[xx][yy][1] == 'h' || matriz[xx][yy][1] == 'l')
                    {
                        if(movZ + 2 + sin(ConverteAng(angloDrone) * PASSO) >= ((yy) * 20) + 8)
                        {
                            printf("Impedido de realizar movimento!!\n");
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
                                movX = movX + (cos(ConverteAng(-angloDrone)) * PASSO);
                                //movZ = movZ +  (sin(ConverteAng(-angloDrone)) * PASSO);
                                objectPosition[0] = objectPosition[0] - 5 * (cos(ConverteAng(-angloDrone)) * PASSO);
                                //objectPosition[2] =  objectPosition[2] - 5 * (sin(ConverteAng(-angloDrone)) * PASSO);
                                if(movX >= ((xx) * 20) + 8)
                                    fim = 0;
                                break;
                            }
                            else if(matriz[xx][yy][1] == '-' || matriz[xx][yy][1] == 'j' || matriz[xx][yy][1] == 'h')
                            {
                                //movX = movX +  (cos(ConverteAng(-angloDrone)) * PASSO);
                                movZ = movZ + (sin(ConverteAng(-angloDrone)) * PASSO);
                                //objectPosition[0] =  objectPosition[0] - 5 * (cos(ConverteAng(-angloDrone)) * PASSO);
                                objectPosition[2] = objectPosition[2] - 5 * (sin(ConverteAng(-angloDrone)) * PASSO);
                                if(movZ >= ((yy) * 20) + 8)
                                    fim = 0;
                                break;
                            }
                        }
                    }

                    if(matriz[xx][yy][1] == 'n' || matriz[xx][yy][1] == 'J' || matriz[xx][yy][1] == 'H' || matriz[xx][yy][1] == 'c' || matriz[xx][yy][1] == 'u' || matriz[xx][yy][1] == '|' || matriz[xx][yy][1] == 'j')
                    {
                        //printf("Proximo Movimento em x = %f\n", movX+sqrt(7)+ sin(ConverteAng(angloDrone)* PASSO));
                        if(movX + sqrt(7) + cos(ConverteAng(angloDrone) * PASSO) >= ((xx) * 20) + 8)
                        {
                            printf("Impedido de realizar movimento!!\n");
                            break;
                        }
                    }
                    if(matriz[xx][yy][1] == 'n' || matriz[xx][yy][1] == 'T' || matriz[xx][yy][1] == 'd' || matriz[xx][yy][1] == 'j' || matriz[xx][yy][1] == '-' || matriz[xx][yy][1] == 'c' || matriz[xx][yy][1] == 'h' || matriz[xx][yy][1] == 'l')
                    {
                        if(movZ + sqrt(7) + sin(ConverteAng(angloDrone) * PASSO) >= ((yy) * 20) + 8)
                        {
                            printf("Impedido de realizar movimento!!\n");
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
                                movX = movX + (cos(ConverteAng(-angloDrone)) * PASSO);
                                //movZ = movZ +  (sin(ConverteAng(-angloDrone)) * PASSO);
                                objectPosition[0] = objectPosition[0] - 5 * (cos(ConverteAng(-angloDrone)) * PASSO);
                                //objectPosition[2] =  objectPosition[2] - 5 * (sin(ConverteAng(-angloDrone)) * PASSO);
                                if(movX >= ((xx) * 20) + 8)
                                    fim = 0;
                                break;
                            }
                            else if(matriz[xx][yy][1] == '+')
                            {
                                //movX = movX +  (cos(ConverteAng(-angloDrone)) * PASSO);
                                movZ = movZ + (sin(ConverteAng(-angloDrone)) * PASSO);
                                //objectPosition[0] =  objectPosition[0] - 5 * (cos(ConverteAng(-angloDrone)) * PASSO);
                                objectPosition[2] = objectPosition[2] - 5 * (sin(ConverteAng(-angloDrone)) * PASSO);
                                if(movZ <= ((yy - 1) * 20) + 12)
                                    fim = 0;
                                break;
                            }
                        }
                    }

                    if(matriz[xx][yy][1] == 'n' || matriz[xx][yy][1] == 'J' || matriz[xx][yy][1] == 'H' || matriz[xx][yy][1] == 'c' || matriz[xx][yy][1] == 'u' || matriz[xx][yy][1] == '|' || matriz[xx][yy][1] == 'j')
                    {
                        printf("Proximo Movimento em x = %f\n", movX + sqrt(7) + sin(ConverteAng(angloDrone) * PASSO));
                        if(movX + sqrt(7) + cos(ConverteAng(angloDrone) * PASSO) >= ((xx) * 20) + 8)
                        {
                            printf("Impedido de realizar movimento!!\n");
                            break;
                        }
                    }
                    if(matriz[xx][yy][1] == 'J' || matriz[xx][yy][1] == 'L' || matriz[xx][yy][1] == 'd' || matriz[xx][yy][1] == 'c' || matriz[xx][yy][1] == 'u' || matriz[xx][yy][1] == 'h' || matriz[xx][yy][1] == '+')
                    {
                        if(movZ - sqrt(7) + sin(ConverteAng(angloDrone) * PASSO) <= (yy - 1) * 20 + 12)
                        {
                            printf("Impedido de realizar movimento!!\n");
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
                                movX = movX + (cos(ConverteAng(-angloDrone)) * PASSO);
                                //movZ = movZ +  (sin(ConverteAng(-angloDrone)) * PASSO);
                                objectPosition[0] = objectPosition[0] - 5 * (cos(ConverteAng(-angloDrone)) * PASSO);
                                //objectPosition[2] =  objectPosition[2] - 5 * (sin(ConverteAng(-angloDrone)) * PASSO);
                                if(movX <= ((xx - 1) * 20) + 11)
                                    fim = 0;
                                break;
                            }
                            else if(matriz[xx][yy][1] == '+')
                            {
                                //movX = movX +  (cos(ConverteAng(-angloDrone)) * PASSO);
                                movZ = movZ + (sin(ConverteAng(-angloDrone)) * PASSO);
                                //objectPosition[0] =  objectPosition[0] - 5 * (cos(ConverteAng(-angloDrone)) * PASSO);
                                objectPosition[2] = objectPosition[2] - 5 * (sin(ConverteAng(-angloDrone)) * PASSO);
                                if(movZ <= ((yy - 1) * 20) + 12)
                                    fim = 0;
                                break;
                            }
                        }
                    }
                    if(matriz[xx][yy][1] == 'n' || matriz[xx][yy][1] == 'T' || matriz[xx][yy][1] == 'L' || matriz[xx][yy][1] == '_' || matriz[xx][yy][1] == 'H' || matriz[xx][yy][1] == 'd' || matriz[xx][yy][1] == 'u' || matriz[xx][yy][1] == 'l')
                    {
                        if(movX - sqrt(7) + cos(ConverteAng(angloDrone) * PASSO) <= (xx - 1) * 20 + 11)
                        {
                            printf("Impedido de realizar movimento!!\n");
                            break;
                        }
                    }
                    if(matriz[xx][yy][1] == 'J' || matriz[xx][yy][1] == 'L' || matriz[xx][yy][1] == 'd' || matriz[xx][yy][1] == 'c' || matriz[xx][yy][1] == 'u' || matriz[xx][yy][1] == 'h' || matriz[xx][yy][1] == '+')
                    {
                        if(movZ - sqrt(7) + sin(ConverteAng(angloDrone) * PASSO) <= (yy - 1) * 20 + 12)
                        {
                            printf("Impedido de realizar movimento!!\n");
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
                            movX = movX + (cos(ConverteAng(-angloDrone)) * PASSO);
                            //movZ = movZ +  (sin(ConverteAng(-angloDrone)) * PASSO);
                            objectPosition[0] = objectPosition[0] - 5 * (cos(ConverteAng(-angloDrone)) * PASSO);
                            //objectPosition[2] =  objectPosition[2] - 5 * (sin(ConverteAng(-angloDrone)) * PASSO);
                            if(movX <= ((xx - 1) * 20) + 11)
                                fim = 0;
                            break;
                        }
                        else if(matriz[xx][yy][1] == '-' || matriz[xx][yy][1] == 'j' || matriz[xx][yy][1] == 'h')
                        {
                            //movX = movX +  (cos(ConverteAng(-angloDrone)) * PASSO);
                            movZ = movZ + (sin(ConverteAng(-angloDrone)) * PASSO);
                            //objectPosition[0] =  objectPosition[0] - 5 * (cos(ConverteAng(-angloDrone)) * PASSO);
                            objectPosition[2] = objectPosition[2] - 5 * (sin(ConverteAng(-angloDrone)) * PASSO);
                            if(movZ >= ((yy) * 20) + 8)
                                fim = 0;
                            break;
                        }
                    }
                    if(matriz[xx][yy][1] == 'n' || matriz[xx][yy][1] == 'T' || matriz[xx][yy][1] == 'L' || matriz[xx][yy][1] == '_' || matriz[xx][yy][1] == 'H' || matriz[xx][yy][1] == 'd' || matriz[xx][yy][1] == 'u' || matriz[xx][yy][1] == 'l')
                    {
                        if(movX - sqrt(7) + cos(ConverteAng(angloDrone) * PASSO) <= (xx - 1) * 20 + 11)
                        {
                            printf("Impedido de realizar movimento!!\n");
                            break;
                        }
                    }
                    if(matriz[xx][yy][1] == 'n' || matriz[xx][yy][1] == 'T' || matriz[xx][yy][1] == 'd' || matriz[xx][yy][1] == 'j' || matriz[xx][yy][1] == '-' || matriz[xx][yy][1] == 'c' || matriz[xx][yy][1] == 'h' || matriz[xx][yy][1] == 'l')
                    {
                        printf("Proximo Valor de z sera:  %f\n", movZ + sqrt(7) + sin(ConverteAng(angloDrone) * PASSO));

                        if(movZ + sqrt(7) + sin(ConverteAng(angloDrone) * PASSO) >= ((yy) * 20) + 8)
                        {
                            printf("Impedido de realizar movimento!!\n");
                            break;
                        }
                    }
                }

                printf("X0: %d %d\n", x0, y0);
                printf("XX: %d %d\n", xx, yy);

                if(matriz[x0][y0][0] != 'F')
                    matriz[x0][y0][0] = '|';

                //reailiza movimento
                movX = movX + (cos(ConverteAng(-angloDrone)) * PASSO);
                movZ = movZ + (sin(ConverteAng(-angloDrone)) * PASSO);
                objectPosition[0] = objectPosition[0] - 5 * (cos(ConverteAng(-angloDrone)) * PASSO);
                objectPosition[2] = objectPosition[2] - 5 * (sin(ConverteAng(-angloDrone)) * PASSO);

                if(matriz[xx][yy][0] != 'F')
                    matriz[xx][yy][0] = 'S';

                printf("%f %f\n", movX, movZ);

                verificaChave();
                break;
            case GLUT_KEY_DOWN:
                x0 = trunc((movX + 11) / 20);
                y0 = trunc((movZ + 11) / 20);

                xx = trunc((movX + 11 - (cos(ConverteAng(-angloDrone)) * PASSO)) / 20);
                yy = trunc((movZ + 11 - (sin(ConverteAng(-angloDrone)) * PASSO)) / 20);

                if(angloDrone == 0)
                {

                    if(matriz[xx][yy][1] == 'n' || matriz[xx][yy][1] == 'T' || matriz[xx][yy][1] == 'L' || matriz[xx][yy][1] == '_' || matriz[xx][yy][1] == 'H' || matriz[xx][yy][1] == 'd' || matriz[xx][yy][1] == 'u' || matriz[xx][yy][1] == 'l')
                    {
                        if(xx == 0)
                        {
                            if(movX - cos(ConverteAng(angloDrone) * PASSO) <= -7)
                            {
                                printf("Impedido de realizar movimento!!\n");
                                break;
                            }
                        }
                        else if(movX - 1.5 - cos(ConverteAng(angloDrone) * PASSO) <= (xx - 1) * 20 + 10)
                        {
                            printf("Impedido de realizar movimento!!\n");
                            break;
                        }
                    }
                }
                else if(angloDrone == 180 || angloDrone == -180)
                {
                    if(matriz[xx][yy][1] == '0')
                    {
                        printf("Impedido de realizar movimento!!\n");
                        break;
                    }
                    else if(matriz[xx][yy][1] == 'n' || matriz[xx][yy][1] == 'J' || matriz[xx][yy][1] == 'H' || matriz[xx][yy][1] == 'c' || matriz[xx][yy][1] == 'u' || matriz[xx][yy][1] == '|' || matriz[xx][yy][1] == 'j')
                    {
                        if(movX + 1.5 - cos(ConverteAng(angloDrone) * PASSO) >= (xx * 20 + 9))
                        {
                            printf("Impedido de realizar movimento!!\n");
                            break;
                        }
                    }
                }
                else if(angloDrone == -90 || angloDrone == 270)
                {
                    if(matriz[xx][yy][1] == '0')
                    {
                        printf("Impedido de realizar movimento!!\n");
                        break;
                    }
                    if(matriz[xx][yy][1] == 'J' || matriz[xx][yy][1] == 'L' || matriz[xx][yy][1] == 'd' || matriz[xx][yy][1] == 'h' || matriz[xx][yy][1] == 'u' || matriz[xx][yy][1] == 'c' || matriz[xx][yy][1] == '+')
                    {
                        if(movZ - 1 - sin(ConverteAng(angloDrone) * PASSO) <= (yy - 1) * 20 + 12)
                        {
                            printf("Impedido de realizar movimento!!\n");
                            break;
                        }
                    }
                }
                else if(angloDrone == 90 || angloDrone == -270)
                {
                    if(matriz[xx][yy][1] == '0')
                    {
                        printf("Impedido de realizar movimento!!\n");
                        break;
                    }
                    if(matriz[xx][yy][1] == 'n' || matriz[xx][yy][1] == 'T' || matriz[xx][yy][1] == '-' || matriz[xx][yy][1] == 'h' || matriz[xx][yy][1] == 'l' || matriz[xx][yy][1] == 'c' || matriz[xx][yy][1] == 'j' || matriz[xx][yy][1] == 'd')
                    {
                        if(movZ + 1.5 - sin(ConverteAng(angloDrone) * PASSO) >= (yy * 20 + 8))
                        {
                            printf("Impedido de realizar movimento!!\n");
                            break;
                        }
                    }
                }
                else if((angloDrone < 0 && angloDrone > -90) || (angloDrone < 360 && angloDrone > 270))
                {
                    if(matriz[xx][yy][1] == 'n' || matriz[xx][yy][1] == 'T' || matriz[xx][yy][1] == 'L' || matriz[xx][yy][1] == '_' || matriz[xx][yy][1] == 'H' || matriz[xx][yy][1] == 'd' || matriz[xx][yy][1] == 'u' || matriz[xx][yy][1] == 'l')
                    {
                        if(movX - sqrt(7) - cos(ConverteAng(angloDrone) * PASSO) <= (xx - 1) * 20 + 10)
                        {
                            printf("Impedido de realizar movimento!!\n");
                            break;
                        }
                    }
                    if(matriz[xx][yy][1] == 'J' || matriz[xx][yy][1] == 'L' || matriz[xx][yy][1] == 'd' || matriz[xx][yy][1] == 'h' || matriz[xx][yy][1] == 'u' || matriz[xx][yy][1] == 'c' || matriz[xx][yy][1] == '+')
                    {
                        if(movZ - sqrt(7) - sin(ConverteAng(angloDrone) * PASSO) <= (yy - 1) * 20 + 12)
                        {
                            printf("Impedido de realizar movimento!!\n");
                            break;
                        }
                    }
                }
                else if((angloDrone > 0 && angloDrone < 90) || (angloDrone > -360 && angloDrone < -270))
                {
                    if(matriz[xx][yy][1] == 'n' || matriz[xx][yy][1] == 'T' || matriz[xx][yy][1] == 'L' || matriz[xx][yy][1] == '_' || matriz[xx][yy][1] == 'H' || matriz[xx][yy][1] == 'd' || matriz[xx][yy][1] == 'u' || matriz[xx][yy][1] == 'l')
                    {
                        if(movX - sqrt(7) - cos(ConverteAng(angloDrone) * PASSO) <= (xx - 1) * 20 + 10)
                        {
                            printf("Impedido de realizar movimento!!\n");
                            break;
                        }
                        if(matriz[xx][yy][1] == 'n' || matriz[xx][yy][1] == 'T' || matriz[xx][yy][1] == '-' || matriz[xx][yy][1] == 'h' || matriz[xx][yy][1] == 'l' || matriz[xx][yy][1] == 'c' || matriz[xx][yy][1] == 'j' || matriz[xx][yy][1] == 'd')
                        {
                            if(movZ + sqrt(7) - sin(ConverteAng(angloDrone) * PASSO) >= (yy * 20 + 8))
                            {
                                printf("Impedido de realizar movimento!!\n");
                                break;
                            }
                        }
                    }
                }
                else if((angloDrone > 90 && angloDrone < 180) || (angloDrone > -180 && angloDrone < -270))
                {
                    if(matriz[xx][yy][1] == 'n' || matriz[xx][yy][1] == 'J' || matriz[xx][yy][1] == 'H' || matriz[xx][yy][1] == 'c' || matriz[xx][yy][1] == 'u' || matriz[xx][yy][1] == '|' || matriz[xx][yy][1] == 'j')
                    {
                        if(movX + sqrt(7) - cos(ConverteAng(angloDrone) * PASSO) >= (xx * 20 + 9))
                        {
                            printf("Impedido de realizar movimento!!\n");
                            break;
                        }
                    }
                    if(matriz[xx][yy][1] == 'n' || matriz[xx][yy][1] == 'T' || matriz[xx][yy][1] == '-' || matriz[xx][yy][1] == 'h' || matriz[xx][yy][1] == 'l' || matriz[xx][yy][1] == 'c' || matriz[xx][yy][1] == 'j' || matriz[xx][yy][1] == 'd')
                    {
                        if(movZ + sqrt(7) - sin(ConverteAng(angloDrone) * PASSO) >= (yy * 20 + 8))
                        {
                            printf("Impedido de realizar movimento!!\n");
                            break;
                        }
                    }
                }
                else if((angloDrone > 180 && angloDrone < 270) || (angloDrone < -90 && angloDrone > -180))
                {
                    if(matriz[xx][yy][1] == 'J' || matriz[xx][yy][1] == 'L' || matriz[xx][yy][1] == 'd' || matriz[xx][yy][1] == 'h' || matriz[xx][yy][1] == 'u' || matriz[xx][yy][1] == 'c')
                    {
                        if(movZ - sqrt(7) - sin(ConverteAng(angloDrone) * PASSO) <= (yy - 1) * 20 + 12)
                        {
                            printf("Impedido de realizar movimento!!\n");
                            break;
                        }
                    }
                    if(matriz[xx][yy][1] == 'n' || matriz[xx][yy][1] == 'J' || matriz[xx][yy][1] == 'H' || matriz[xx][yy][1] == 'c' || matriz[xx][yy][1] == 'u' || matriz[xx][yy][1] == '|' || matriz[xx][yy][1] == 'j')
                    {
                        if(movX + sqrt(7) - cos(ConverteAng(angloDrone) * PASSO) >= (xx * 20 + 9))
                        {
                            printf("Impedido de realizar movimento!!\n");
                            break;
                        }
                    }
                }

                //                if(matriz[x0][y0][0] != 'F')
                //                    matriz[x0][y0][0] = '|';

                //reailiza movimento
                movX = movX - (cos(ConverteAng(-angloDrone)) * PASSO);
                movZ = movZ - (sin(ConverteAng(-angloDrone)) * PASSO);
                objectPosition[0] = objectPosition[0] + 5 * (cos(ConverteAng(-angloDrone)) * PASSO);
                objectPosition[2] = objectPosition[2] + 5 * (sin(ConverteAng(-angloDrone)) * PASSO);
                verificaChave();

                //                if(matriz[xx][yy][0] != 'F')
                //                    matriz[xx][yy][0] = 'S';
                break;
        }

        printf("\n\n");
        for(int i = 0; i < 9; i++)
        {
            for(int j = 0; j < 9; j++)
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
        case 't':
            objectPosition[0] += 10;
            objectPosition[1] -= 10;
//            objectPosition[2]+=10;
            break;
        case 'f':
            fim = 0;
            break;
        case 27:
            exit(0); //ESC
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

// Especifica a posi��o inicial da janela GLUT
    glutInitWindowPosition(5, 5);

// Especifica o tamanho inicial em pixels da janela GLUT
    glutInitWindowSize(700, 700);

// Cria a janela passando como argumento o titulo da mesma
    glutCreateWindow("Labirinto");

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

