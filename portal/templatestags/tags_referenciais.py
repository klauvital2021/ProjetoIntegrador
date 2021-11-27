from django import template


register = template.library()

@register.simple_tag
def vl_considerado(metro, gordura, taxa):
    considerado = metro - gordura - taxa
    return round(float(considerado), 2)
