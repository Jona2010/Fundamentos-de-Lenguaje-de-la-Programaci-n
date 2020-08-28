#include<iostream>
using namespace std;

struct Lista{
  int n;
  Lista *sgte;
}*cab = nullptr, *aux=nullptr, *aux1=nullptr;

int op=0;
int insertar(void){
  do{
      aux=new Lista;
      cout<<"Ingrese numero: ";
      cin>>aux->n;

      aux->sgte = nullptr;

      if(cab==nullptr){
        cab=aux;
      }
      else{
        aux1->sgte=aux;
      }
      aux1=aux;
      cout<<"Desea seguir ingresando?: 1: SI, 0: NO"<<endl;
      cin>>op;
    }while(op==1);
    return 1;
};

void mostrar_lista(void){
  int n=0;
  if(cab!=NULL){
    for(aux=cab; aux!=nullptr; aux=aux->sgte){
      if (n>0){
        cout<<"->";
      }
      cout<<aux->n;
      n=1;
    }
  }
  else{
    cout<<"La Lista está vacía";
  }
  cout<<endl;
}

int buscar_lista(){
  int v=0;
  cout<<"Ingresar nodo a buscar: ";
  cin>>v;
  if(cab!=nullptr){
    for(aux=cab; aux!=nullptr; aux=aux->sgte){
      if(aux->n==v){
        cout<<"El elemento si existe"<<endl;
        return 1;
      }
    }
    cout<<"El elemento no existe"<<endl;
    return 0;
  }
  else{
    cout<<"La lista esta vacia"<<endl;
    return 0;
  }
};

Lista* consulta(int n){
  Lista* temp=new Lista();
  if(cab!=nullptr){
    for(aux=cab; aux!=nullptr; aux=aux->sgte){
      if(aux->n==n){
        temp=aux;
        return temp;
      }
    }
    cout<<"El elemento no existe"<<endl;
  }
  return 0;
}

int eliminar_lista(){
    Lista *temp = new Lista();
    //temp = consulta(n);
    /*if(!temp){
        cout << "El registro no existe\n";
        return 1;
    }*/
    int n=0;
    cout<<"Ingrese nodo a eliminar: ";
    cin>>n;
    for(aux=cab; aux!=nullptr; aux=aux->sgte){
      if((aux->n==n) && (aux->sgte!=nullptr) && (aux==cab)){
        //cout<<"Elimina al inicio con siguiente"<<endl;
        //temp=aux;
        cab=aux->sgte;
        delete aux;
        return 1;
      }
      if((aux->n==n) && (aux->sgte==nullptr) && (aux==cab)){
        //cout<<"Elimina al inicio unico"<<endl;
        cab=nullptr;
        return 1;
      }
      else if((aux->n==n) && (aux->sgte==nullptr) && (aux!=cab)){
        //cout<<"Elimina al final"<<endl;
        temp->sgte=nullptr;
        delete aux;
        return 1;
      }
      else if((aux->n==n) && (aux->sgte!=nullptr) && (aux!=cab)){
        //cout<<"Elimina al medio"<<endl;
        //temp=aux;3
        temp->sgte=aux->sgte;
        delete aux;
        return 1;
      }
        temp=aux;
    }
    cout<<"El registro no existe"<<endl;
    return 0;
}

int main(){
  int op=0;
  while(op!=5){
  cout<<"Menu:------------------"<<endl;
  cout<<"1. Insertar"<<endl;
  cout<<"2. Mostrar"<<endl;
  cout<<"3. Buscar"<<endl;
  cout<<"4. Eliminar"<<endl;
  cout<<"5. Salir"<<endl;
  cin>>op;
  switch(op){
    case 1:
      insertar();
      break;
    case 2:
      mostrar_lista();
      break;
    case 3:
      buscar_lista();
      break;
    case 4:
      eliminar_lista();
      break;
    case 5:
      break;
    default:
      cout<<"No existe la opcion"<<endl;
      break;
  }
  }
}