from django import template
from portal.models import Imovel

register = template.library

def vl_considerado(metro, gordura, taxa):
    considerado = metro - gordura - taxa
    return considerado
