:: Creamos las unidades organizativas
dsadd ou "ou=Aula2,dc=Medac,dc=com"
dsadd ou "ou=Users,ou=Aula2,dc=Medac,dc=com"
dsadd ou "ou=Groups,ou=Aula2,dc=Medac,dc=com"
dsadd ou "ou=Computers,ou=Aula2,dc=Medac,dc=com"

::Creamos los grupos dentro de la OU Groups
dsadd group "cn=Fila1,ou=Groups,ou=Aula2,dc=Medac,dc=com"
dsadd group "cn=Fila2,ou=Groups,ou=Aula2,dc=Medac,dc=com"
dsadd group "cn=Fila3,ou=Groups,ou=Aula2,dc=Medac,dc=com"
dsadd group "cn=Fila4,ou=Groups,ou=Aula2,dc=Medac,dc=com" 
dsadd group "cn=Group,ou=Groups,ou=Aula2,dc=Medac,dc=com"

::Creamos los usuarios dentro de la OU Users
for /L %%i in (1,1,20) do(
    dsadd user "cn=A2User0%%i,ou=Users,ou=Aula2,dc=Medac,dc=com" -samid user%%i -pwd Itep@1234 -company Itep  -upn User%%i@medac.com -mustchpwd yes
)

::Creamos los ordenadores dentro de la OU Computers
for /L %%i in (1,1,20) do(
    dsadd computer "cn=A2Computer0%%i,ou=Computers,ou=Aula2,dc=Medac,dc=com"
)


:: Una vez creados los usuarios, asignamos los usuarios a sus filas correspondientes y todos al grupo "Group"

for /L %%i in (1,1,5) do(
    dsmod group "cn=Fila1,ou=Groups,ou=Aula2,dc=Medac,dc=com" -addmbr "cn=User%%i,ou=Users,ou=Aula2,dc=Medac,dc=com"
)

for /L %%i in (6,1,10) do(
    dsmod group "cn=Fila2,ou=Groups,ou=Aula2,dc=Medac,dc=com" -addmbr "cn=User%%i,ou=Users,ou=Aula2,dc=Medac,dc=com"
)

for /L %%i in (11,1,15) do(
    dsmod group "cn=Fila3,ou=Groups,ou=Aula2,dc=Medac,dc=com" -addmbr "cn=User%%i,ou=Users,ou=Aula2,dc=Medac,dc=com"
)


for /L %%i in (16,1,20) do(
    dsmod group "cn=Fila4,ou=Groups,ou=Aula2,dc=Medac,dc=com" -addmbr "cn=User%%i,ou=Users,ou=Aula2,dc=Medac,dc=com"
)

for /L %%i in (1,1,20) do(
    dsmod group "cn=Group,ou=Groups,ou=Aula2,dc=Medac,dc=com" -addmbr "cn=User%%i,ou=Users,ou=Aula2,dc=Medac,dc=com"
)




