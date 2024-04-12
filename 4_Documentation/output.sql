USE DM_FX_EXCHANGE

SELECT CONCAT(B.Name,'/',C.NAME) AS ccy_couple,
	A.currentRate AS rate,
	CONCAT('"', A.yesterdayNYTimeChange, '"') AS change
FROM  B_FX_EXCHANGE_F_CURRENCY_RATE A
LEFT JOIN A_FX_EXCHANGE_L_CURRENCY B
ON A.baseCurrencyIds = B.CurrencyIds
	LEFT JOIN A_FX_EXCHANGE_L_CURRENCY C
	ON A.quoteCurrencyIds = C.CurrencyIds