
def vl_considerado(metro, gordura, taxa):
    considerado = metro - gordura - taxa
    return considerado

metro_quadr_final = 0
metro_quadrado_inicial = 6800.50
desconto_oferta = 0
desconto_calculado = 142.40

metro_quadr_final = vl_considerado(metro_quadrado_inicial, desconto_oferta, desconto_calculado)
print(metro_quadr_final)