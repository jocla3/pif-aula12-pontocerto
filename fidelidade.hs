semCampanha :: Int -> Int
semCampanha p = p

pontosEmDobro :: Int -> Int
pontosEmDobro = \p -> p * 2

bonus50 :: Int -> Int
bonus50 = \p -> p + 50

campanhaDaSemana :: Int -> Int
campanhaDaSemana = pontosEmDobro

main :: IO ()
main = do
  putStrLn "--- Desafio 1 ---"
  print (semCampanha 120)
  print (pontosEmDobro 120)
  print (bonus50 120)
  print (campanhaDaSemana 120)
