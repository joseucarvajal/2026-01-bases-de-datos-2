# Explicación: Control de Usuarios, Roles y Privilegios

## ¿Para qué sirven?

| Concepto | ¿Qué hace? |
|---|---|
| `CREATE ROLE` | Define un perfil de permisos reutilizable — se asigna a uno o más usuarios |
| `GRANT ... TO rol` | Otorga privilegios concretos (SELECT, INSERT, UPDATE…) a un rol |
| `CREATE USER` | Crea una cuenta de acceso a MySQL con contraseña |
| `GRANT rol TO usuario` | Vincula un rol (con todos sus privilegios) a un usuario |
| `SET DEFAULT ROLE` | Activa automáticamente el rol al conectarse — sin esto el usuario debe activarlo manualmente |
| `REVOKE` | Retira privilegios o roles de un usuario |
| `DROP ROLE` | Elimina un rol del sistema y revoca automáticamente todas sus asignaciones a usuarios |
| `DROP USER` | Elimina la cuenta de un usuario |
| `FLUSH PRIVILEGES` | Recarga la tabla de privilegios en memoria para que los cambios surtan efecto de inmediato |

**Regla general:** Los privilegios nunca se asignan directamente al usuario — se agrupan en roles y los roles se asignan al usuario. Esto evita repetir los mismos `GRANT` para cada persona con el mismo cargo.

---
