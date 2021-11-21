import math
from django.shortcuts import render, redirect, get_object_or_404
from django.db.models import Q
import django_filters
import locale

from portal.forms import ImovelForm, PadraoForm, NomecondominioForm, EstadoconserForm, TipoForm, ImovelFormFilter
from portal.models import Imovel, Padrao, Nomecondominio, Estadoconser, Tipo, Tabelarossheideck


def home(request):
    return render(request, 'portal/home.html')

def TesteRetorno(request):
    context = {}

    if request.method == "POST":
        condominio = request.POST.get ('condominio', None)
        bairro = request.POST.get('bairro', None)

        erro = {}

        if condominio != "Odila":
            erro['condominio']= "O nome nao é esperado"
        if bairro != "Claudia":
                erro['bairro']= "O nome nao é esperado"

        if erro:
               context ['erros'] = erro
        else:
               # qdo nao tem erro
               print("Salvando os dados")
               context['mensagem'] = "Os dados foram salvos com sucesso!"

    return render(request, 'portal/retorno.html', context=context)


def filtraCondominio(request):
    form = ImovelFormFilter(request.GET)
    context = {
        'form': form,
    }
    return render(request, 'portal/avaliacao.html', context)


def referenciais(request):
   media_m2 = ''
   valorAvaliacao = ''
   metro_quadr = 0
   cont = 0
   vidautil = 0
   linha = 0
   coluna = ''
   if request.method == "POST":

       uso = request.POST.get('uso')
       tipo = request.POST.get('tipo')
       conservacao= request.POST.get('estadoConserv')
       padrao = request.POST.get('padrao')
       idade = int(request.POST.get('idade'))
       aT = request.POST.get('atotal')
       aC = int(request.POST.get('aconstruida'))
       condominio = request.POST.get('condominio')
       bairro = request.POST.get('bairro')
       cidade = request.POST.get('cidade')
       estado = request.POST.get('estado')

       busca = Q(
           Q(
               Q(nomecondominio__nome=condominio) | Q(bairro=bairro)
           )
           & Q(padrao__nome=padrao)
           & Q(tipo__nome=tipo)
          )
       dados = (uso, tipo, conservacao, padrao, idade, aT, aC,
                condominio, bairro, cidade, estado)

       Listimovel = Imovel.objects.filter(busca)


       for i in Listimovel:
           if idade == i.idade:
               metro_quadr += (i.metroquadrado())
               cont += 1
               print(metro_quadr, cont)
           else:
               ec = i.estadoconser.codigo
               vidautil = math.ceil(((idade - i.idade) * 100) / i.vidautil.idadevidautil)
               lst = [field.name for field in Tabelarossheideck._meta.get_fields()]
               print(lst)
               if ec in lst:
                   # retorna o indice que esta a coluna
                   indice_coluna = lst.index(ec)
                   # retorna a coluna de acordo com o indice
                   coluna = lst.pop(indice_coluna)
                   # retorna o id da tabelarossheideck de acordo com a vida util
                   linha = Tabelarossheideck(idade_em_vida=vidautil)
                   linha.save()
                   linha.id
                   print(linha.id)

                   # tem que retornar o valor da tabela de acordo com id e a coluna
                   ### :( não sei fazer o filtro
                   indice_trh = Tabelarossheideck.objects.filter(id=linha, ec=coluna)
                   metro_quadr += (i.metroquadrado() - ((i.metroquadrado() * indice_trh) / 100))
                   cont += 1

           media_m2 = round(metro_quadr / cont, 2)
           locale.setlocale(locale.LC_ALL, 'pt_BR.UTF-8')
           valorAvaliacao = (media_m2 * aC)
      #     media_m2 = locale.currency(media_m2)
      #     valorAvaliacao = locale.currency(valorAvaliacao)

           media_m2 = "R$ {:,.2f}".format(media_m2).replace(",", "X").replace(".", ",").replace("X", ".")
           valorAvaliacao = "R$ {:,.2f}".format(valorAvaliacao).replace(",", "X").replace(".", ",").replace("X", ".")

       context = {
           'filtroCond': Listimovel,
           'dados': dados,
           'valor': valorAvaliacao,
           'media_metro2':media_m2,
           'area_construida': aC,
       }
       return render(request, 'portal/referenciais.html', context=context)


def calcula(request):
    ac = request.POST.get('dados.6')
    imoveis = request.POST.get('filtroCond')
    ok = request.POST.get('ok')

    for Imovel in imoveis:
        metro2 = (metro2+ (Imovel.valordevenda/Imovel.aconstruida))
        cont = cont + 1
        media = (metro2/ cont)
        print(metro2, cont, media)

    valorAvaliacao= (metro2 * ac)

    context = {
        'metro2': metro2,
        'contador':cont,
        'media' : media,
        'Precificação': valorAvaliacao,
    }
    return render(request, 'portal/calculos.html', context=context)

def imovel_edit(request, imovel_pk):
    imovel = get_object_or_404(Imovel, pk=imovel_pk)
    form = ImovelForm(instance=imovel)

    if (request.method == 'POST'):
        form = ImovelForm(request.POST, instance=imovel)

        if (form.is_valid()):
            imovel = form.save(commit=False)
            imovel.save()
            return redirect('imoveis')
        else:
            return render(request, 'portal/imovel_edit.html', {'form': form, 'post': imovel})

    elif (request.method == 'GET'):
        return render(request, 'portal/imovel_edit.html', {'form': form, 'post': imovel})


def imovel(request):
    imoveis = Imovel.objects.all()
    context = {
        'imoveis': imoveis
    }
    return render(request, 'portal/imoveis.html', context)


def imovel_add(request):
    form = ImovelForm(request.POST or None)
    if request.POST:
        if form.is_valid():
            form.save()
            return redirect('imoveis')

    context = {
        'form': form,
    }
    return render(request, 'portal/imovel_add.html', context)


def imovel_delete(request, imovel_pk):
    imovel = Imovel.objects.get(pk=imovel_pk)
    imovel.delete()
    return redirect('imoveis')


def padrao (request):
    padrao = Padrao.objects.all()
    context = {
        'padrao': padrao
    }
    return render(request, 'portal/padrao.html', context)

def padrao_add(request):
    form = PadraoForm(request.POST or None)

    if request.POST:
        if form.is_valid():
            form.save()
            return redirect('padrao')

    context = {
        'form': form,
    }
    return render(request, 'portal/padrao_add.html', context)

def condominio (request):
    condominio = Nomecondominio.objects.all()
    context = {
        'condominio': condominio
    }
    return render(request, 'portal/condominio.html', context)

def cond_add(request):
    form = NomecondominioForm(request.POST or None)

    if request.POST:
        if form.is_valid():
            form.save()
            return redirect('condominio')

    context = {
        'form': form,
    }
    return render(request, 'portal/cond_add.html', context)


def cond_edit(request, cond_pk):
    condominio = Nomecondominio.objects.get(pk=cond_pk)

    form = NomecondominioForm(request.POST or None, instance=condominio)

    if request.POST:
        if form.is_valid():
            form.save()
            return redirect('condominio')

    context = {
        'form': form,
    }
    return render(request, 'portal/cond_edit.html', context)

def cond_delete(request, cond_pk):
    condominio = Imovel.objects.get(pk=cond_pk)
    condominio.delete()

    return redirect('condominio')

def estadoConserv (request):
    estadoConservacao = Estadoconser.objects.all()
    context = {
        'estadoCons': estadoConservacao
    }
    return render(request, 'portal/estadoConservacao.html', context)

def estadoConserv_add(request):
    form = EstadoconserForm(request.POST or None)

    if request.POST:
        if form.is_valid():
            form.save()
            return redirect('estadoConservacao')

    context = {
        'form': form,
    }
    return render(request, 'portal/estadoConservacao_add.html', context)


def tipo(request):
    tipos = Tipo.objects.all()
    context = {
        'tipos': tipos
    }
    return render(request, 'portal/tipo.html', context)


def tipo_add(request):
    form = TipoForm(request.POST or None)

    if request.POST:
        if form.is_valid():
            form.save()
            return redirect('tipo')

    context = {
        'form': form,
    }

    return render(request, 'portal/tipo_add.html', context)