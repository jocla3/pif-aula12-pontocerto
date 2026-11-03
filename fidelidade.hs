semCampanha :: Int -> Int
semCampanha p = p

pontosEmDobro :: Int -> Int
pontosEmDobro = \p -> p * 2

bonus50 :: Int -> Int
bonus50 = \p -> p + 50

campanhaDaSemana :: Int -> Int
campanhaDaSemana = pontosEmDobro

calculaPontos :: (Int -> Int) -> Int -> Int
calculaPontos regra valor = regra valor

main :: IO ()
main = do
  putStrLn "--- Desafio 1 ---"
  print (semCampanha 120)
  print (pontosEmDobro 120)
  print (bonus50 120)
  print (campanhaDaSemana 120)
  putStrLn "--- Desafio 2 ---"
  print (calculaPontos semCampanha 80)
  print (calculaPontos pontosEmDobro 80)
  print (calculaPontos bonus50 80)
  print (calculaPontos (\p -> p * 3) 80)
  print (calculaPontos (\p -> p * 2 + 10) 80)
