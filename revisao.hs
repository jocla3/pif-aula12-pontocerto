campanhaBonus :: Int -> (Int -> Int)
campanhaBonus b = \p -> p + b

pontosEmDobro :: Int -> Int
pontosEmDobro = \p -> p * 2

aplicaRegraDuasVezes :: (Int -> Int) -> Int -> Int
aplicaRegraDuasVezes regra valor = regra (regra valor)

fimDeSemana :: Int -> Int
fimDeSemana = \p -> p * 4

natal :: Int -> Int
natal = campanhaBonus 300

promocaoAtual :: Int -> Int
promocaoAtual = pontosEmDobro

main :: IO ()
main = do
  print (aplicaRegraDuasVezes pontosEmDobro 10)
  print (fimDeSemana 25)
  print (natal 100)
  print (promocaoAtual 100)
